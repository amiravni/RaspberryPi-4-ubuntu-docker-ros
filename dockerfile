
FROM ubuntu:18.04  
    
    
## ROS MELODIC    
RUN apt-get update
RUN apt-get install -y usbutils gnupg qt5-default software-properties-common
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

RUN add-apt-repository ppa:deadsnakes/ppa 
RUN apt update
RUN apt install python3.4-dev
RUN python3 sample_retrieve_data.py 
RUN pip3 install numpy #matplotlib didn't compile :(


   
#####
#apt-get install gcc-8 g++-8
#update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 60 --slave /usr/bin/g++ g++ /usr/bin/g++-8

#https://medium.com/@zwinny/docker-using-webcam-9fafb26cf1e6
#https://andrei.gherzan.ro/linux/raspbian-rpi4-64/
#https://askubuntu.com/questions/1125808/how-to-upgrade-cmake-in-arm-based-ubuntu
#https://cmake.org/files/v3.13/

#docker run -it --name="XXX" --privileged --shm-size 4G -v=/dev:/dev -v /home/pi/docker/shared:/root/shared  -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/root/.Xauthority --net=host --env="QT_X11_NO_MITSHM=1" ros:melodic /bin/bash


./build/sampleRetrieveData 
malloc(): memory corruption
Aborted (core dumped)

./build/sampleCameraInfo 
Detected 1 camera(s).
====================================
        Camera information
====================================
Id:              0007-2102-0181-2010
Type:            PICOFLEXX
Width:           224
Height:          171
Operation modes: 10
    MODE_9_5FPS_2000
    MODE_9_10FPS_1000
    MODE_9_15FPS_700
    MODE_9_25FPS_450
    MODE_5_35FPS_600
    MODE_5_45FPS_500
    MODE_MIXED_30_5
        this operation mode has 2 streams
    MODE_MIXED_50_5
        this operation mode has 2 streams
    Low_Noise_Extended
    Fast_Acquisition
CameraInfo items: 8
    ( BRIDGE_TYPE, Enclustra )
    ( MODULE_IDENTIFIER, 00000000 )
    ( MODULE_IDENTIFIER_HASH, 558161692 )
    ( MODULE_SERIAL, 0 )
    ( MODULE_SUFFIX,  )
    ( IMAGER, M2450_A12_AIO )
    ( PROCESSING_NAME, Spectre )
    ( PROCESSING_VERSION, 4.2.0.874 )
Bus error (core dumped)
