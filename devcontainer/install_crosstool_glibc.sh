#!/bin/bash
HOME=/home/ros

# patchelf
wget https://github.com/NixOS/patchelf/releases/download/0.18.0/patchelf-0.18.0-x86_64.tar.gz
tar -xzf patchelf-0.18.0-x86_64.tar.gz
mkdir -p $HOME/.local/bin
mv patchelf-0.18.0-x86_64/bin/patchelf $HOME/.local/bin/

# Install crosstool-ng and build a custom toolchain with glibc
wget http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.26.0.tar.bz2
tar -xjf crosstool-ng-1.26.0.tar.bz2

apt-get install -y gcc g++ gperf bison flex texinfo help2man make libncurses5-dev python3-dev autoconf automake libtool libtool-bin gawk wget bzip2 xz-utils unzip patch rsync meson ninja-build
cd crosstool-ng-1.26.0
./configure --prefix=$HOME/crosstool-ng-1.26.0/out
make -j
make install

mkdir -p $HOME/alt_toolchain/x86_64-linux-gnu
cd $HOME/alt_toolchain
export PATH=$PATH:/home/ros/crosstool-ng-1.26.0/out/bin
ct-ng
unset LD_LIBRARY_PATH
ct-ng build

chown -R ros:ros $HOME
