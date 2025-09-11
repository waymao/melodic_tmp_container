#!/bin/bash

cd /home/ros/development
sudo chown -R ros:ros .

# generate git workspace
echo "INFO: Generating git workspace!"
ssh-keygen

echo "printing the public key, please add it to your github account"
echo '========================================='
cat ~/.ssh/id_rsa.pub
echo '========================================='
read -p "Press enter to continue after adding the key to your github account"

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

cd ..
catkin build
