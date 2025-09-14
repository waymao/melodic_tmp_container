#!/bin/bash

cd /home/ros/development
sudo chown -R ros:ros .

# generate git workspace
echo "INFO: Generating git workspace!"

if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -N "" -f ~/.ssh/id_rsa
    echo "Printing the public key, please add it to your GitHub account"
    echo '========================================='
    cat ~/.ssh/id_rsa.pub
    echo '========================================='
    read -p "Press enter to continue after adding the key to your GitHub account"
else
    echo "SSH key already exists. Skipping key generation."
    echo "Printing the public key, please add it to your GitHub account"
    echo '========================================='
    cat ~/.ssh/id_rsa.pub
    echo '========================================='
    read -p "Press enter to continue after adding the key to your GitHub account"
fi

# install iiwa deps
./install_iiwa_deps.sh

# create dorfl ws and make it a sub workspace of tmp catkin ws
mkdir -p dorfl_ws/src
cd dorfl_ws
catkin init
catkin config --extend ~/tmp_catkin_ws/devel

cd src
git clone git@github.com:waymao/barrett_hand.git
git clone git@github.com:h2r/humanoid_brown.git
cd humanoid_brown
git checkout dorfl
git submodule update --init --recursive

# ignore iiwa driver on docker build
touch iiwa_ros/iiwa_driver/CATKIN_IGNORE
touch schunk_modular_robotics/CATKIN_IGNORE
touch schunk_robots/CATKIN_IGNORE
touch SchunkHandBringupPackage/CATKIN_IGNORE

cd ..
catkin build
