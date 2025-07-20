FROM osrf/ros:melodic-desktop-full

ENV DEBIAN_FRONTEND=noninteractive

# Create the target directory in the container
RUN mkdir -p /home/ros/install
RUN adduser --disabled-password --gecos "" ros
RUN usermod -aG sudo ros && echo "ros ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY install_tmp_dependencies.sh /home/ros/install/
COPY install_crosstool_glibc.sh /home/ros/install/

ENV HOME=/home/ros
RUN apt-get update && apt-get install python3-catkin-tools -y

# tmp dependencies
RUN cd /home/ros && chmod +x install/install_tmp_dependencies.sh && ./install/install_tmp_dependencies.sh

# ssh server for vscode
RUN sudo apt-get install openssh-server -y && sudo apt-get clean && sudo mkdir -p /run/sshd

# create glibc symlink for ssh=
RUN cd /home/ros && chmod +x install/install_crosstool_glibc.sh && ./install/install_crosstool_glibc.sh

RUN chown -R ros:ros /home/ros/ && echo "ros:bigbubba" | chpasswd
USER ros

SHELL [ "/bin/bash" ]
