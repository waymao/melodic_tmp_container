export PATH=$HOME/.local/bin/:$PATH
source /opt/ros/melodic/setup.bash
source ~/tmp_catkin_ws/devel/setup.bash

export VSCODE_SERVER_CUSTOM_GLIBC_LINKER=/home/ros/alt_toolchain/x86_64-linux-gnu/x86_64-linux-gnu/sysroot/lib/ld-linux-x86-64.so.2
export VSCODE_SERVER_CUSTOM_GLIBC_PATH=/home/ros/alt_toolchain/x86_64-linux-gnu/x86_64-linux-gnu/sysroot/lib/
export VSCODE_SERVER_PATCHELF_PATH=/home/ros/.local/bin/patchelf

