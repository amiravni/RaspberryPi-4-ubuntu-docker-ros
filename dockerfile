
    6  apt-get update
    7  apt-get install usbutils
   13  sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list'
   18  apt install gnupg
   19  apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
   20  apt update
   21  apt install ros-melodic-desktop
   24  rosdep init
   25  rosdep update
   26  echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
   27  source ~/.bashrc 

   32  cd libroyale-3.21.1.70-LINUX-arm-64Bit/
   33  cd driver/
   34  cd udev/
   38  cp 10-royale-ubuntu.rules /etc/udev/rules.d

   57  cd /root/shared/catkin_ws/
   58  catkin_make
   
