#!/bin/bash


PWD=$(pwd)
mkdir -p ${PWD}/source

### SpaceVecAlg
cd ${PWD}/source
git clone --recursive https://github.com/jrl-umi3218/SpaceVecAlg.git
cd SpaceVecAlg
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DPYTHON_BINDING=OFF ..
make -j
sudo make install


### RBDyn
cd ${PWD}/source
git clone --recursive https://github.com/jrl-umi3218/RBDyn.git
cd RBDyn
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DPYTHON_BINDING=OFF ..
make -j
sudo make install


### mc_rbdyn_urdf
cd ${PWD}/source
git clone --recursive https://github.com/jrl-umi3218/mc_rbdyn_urdf.git
cd mc_rbdyn_urdf
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DPYTHON_BINDING=OFF ..
make -j
sudo make install


### corrade
cd ${PWD}/source
git clone https://github.com/mosra/corrade.git
cd corrade
git checkout 0d149ee9f26a6e35c30b1b44f281b272397842f5
mkdir build && cd build
cmake ..
make -j
sudo make install

### robot_controllers
cd ${PWD}/source
git clone https://github.com/epfl-lasa/robot_controllers.git
cd robot_controllers
mkdir build && cd build
cmake ..
make -j
sudo make install


