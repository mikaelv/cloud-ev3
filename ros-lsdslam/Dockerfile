FROM ros-indigo-zt

RUN sudo apt-get -y update

RUN sudo apt-get -y install python-rosinstall \
  ros-indigo-libg2o ros-indigo-cv-bridge liblapack-dev libblas-dev \
  freeglut3-dev libqglviewer-dev libsuitesparse-dev libx11-dev

# For usb webcam
RUN sudo apt-get -y install libcanberra-gtk-module ros-indigo-usb-cam

# Build lsdslam
RUN mkdir ~/rosbuild_ws
RUN rosws init ~/rosbuild_ws /opt/ros/indigo
RUN mkdir ~/rosbuild_ws/package_dir
RUN cd ~/rosbuild_ws && rosws set -y ~/rosbuild_ws/package_dir -t .
RUN echo "source ~/rosbuild_ws/setup.bash" >> ~/.bashrc
RUN git clone https://github.com/tum-vision/lsd_slam.git ~/rosbuild_ws/package_dir/lsd_slam
RUN rosdep update
RUN bash -c "source ~/.bashrc && cd ~/rosbuild_ws/package_dir && rosmake lsd_slam"

RUN sudo bash -c 'echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf'
RUN sudo bash -c 'echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf'

ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64

#COPY ./LSD_room.bag.zip /home/ros
COPY ./launch /home/ros/launch

# PTAM camera calibration
RUN sudo apt-get -y install ros-indigo-tf ros-indigo-rqt-gui-cpp
RUN mkdir -p ~/catkin_ws/src 
RUN cd ~/catkin_ws/src && git clone https://github.com/ethz-asl/ethzasl_ptam
RUN bash -c "cd ~/catkin_ws && source /ros_entrypoint.sh && catkin_make"