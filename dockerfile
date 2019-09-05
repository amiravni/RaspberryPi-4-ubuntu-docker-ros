
FROM ubuntu:18.04  
    
    
## ROS MELODIC    
RUN apt-get update
RUN apt-get install -y usbutils gnupg qt5-default
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt update
RUN apt install -y ros-melodic-desktop
RUN rosdep init
RUN rosdep update
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

## LIBROYALE
RUN cp /root/libroyale-3.21.1.70-LINUX-arm-64Bit/driver/udev/10-royale-ubuntu.rules /etc/udev/rules.d 
RUN mkdir /root/shared/catkin_ws/
RUN mkdir /root/shared/catkin_ws/src
WORKDIR /root/shared/catkin_ws/
RUN catkin_make

   
#####
apt-get install gcc-8 g++-8
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 60 --slave /usr/bin/g++ g++ /usr/bin/g++-8
