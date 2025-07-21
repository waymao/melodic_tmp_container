#!/bin/bash
HOME=/home/ros

set -e

# patchelf
wget https://github.com/NixOS/patchelf/releases/download/0.18.0/patchelf-0.18.0-x86_64.tar.gz
mkdir patchelf-0.18.0-x86_64 && tar -xzf patchelf-0.18.0-x86_64.tar.gz -C patchelf-0.18.0-x86_64
mkdir -p $HOME/.local/bin
mv patchelf-0.18.0-x86_64/bin/patchelf $HOME/.local/bin/

# Install crosstool-ng and build a custom toolchain with glibc
wget http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.26.0.tar.bz2
tar -xjf crosstool-ng-1.26.0.tar.bz2

sudo apt-get install -y gcc g++ gperf bison flex texinfo help2man make libncurses5-dev python3-dev autoconf automake libtool libtool-bin gawk wget bzip2 xz-utils unzip patch rsync meson ninja-build
cd crosstool-ng-1.26.0
./configure --prefix=$HOME/crosstool-ng-1.26.0/out
make -j
make install

mkdir -p $HOME/alt_toolchain/x86_64-linux-gnu
cp $HOME/install/ct-ng.config $HOME/alt_toolchain/.config
cd $HOME/alt_toolchain
export PATH=$PATH:$HOME/crosstool-ng-1.26.0/out/bin
ct-ng
unset LD_LIBRARY_PATH
ct-ng build


echo "export VSCODE_SERVER_CUSTOM_GLIBC_LINKER=$HOME/alt_toolchain/x86_64-linux-gnu/x86_64-linux-gnu/sysroot/lib/ld-linux-x86-64.so.2" >> $HOME/.bashrc
echo "export VSCODE_SERVER_CUSTOM_GLIBC_PATH=$HOME/alt_toolchain/x86_64-linux-gnu/x86_64-linux-gnu/sysroot/lib/" >> $HOME/.bashrc
echo "export VSCODE_SERVER_PATCHELF_PATH=$HOME/.local/bin/patchelf" >> $HOME/.bashrc


echo "export VSCODE_SERVER_CUSTOM_GLIBC_LINKER=$HOME/alt_toolchain/x86_64-linux-gnu/x86_64-linux-gnu/sysroot/lib/ld-linux-x86-64.so.2" >> $HOME/.profile
echo "export VSCODE_SERVER_CUSTOM_GLIBC_PATH=$HOME/alt_toolchain/x86_64-linux-gnu/x86_64-linux-gnu/sysroot/lib/" >> $HOME/.profile
echo "export VSCODE_SERVER_PATCHELF_PATH=$HOME/.local/bin/patchelf" >> $HOME/.profile
