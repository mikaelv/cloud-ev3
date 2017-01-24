FROM ros-indigo-zt

RUN sudo apt-get -y update

RUN sudo apt-get -y install python-rosinstall \
  ros-indigo-libg2o ros-indigo-cv-bridge liblapack-dev libblas-dev \
  freeglut3-dev libqglviewer-dev libsuitesparse-dev libx11-dev


RUN mkdir ~/rosbuild_ws
RUN rosws init ~/rosbuild_ws /opt/ros/indigo
RUN mkdir ~/rosbuild_ws/package_dir
RUN cd ~/rosbuild_ws && rosws set -y ~/rosbuild_ws/package_dir -t .
RUN echo "source ~/rosbuild_ws/setup.bash" >> ~/.bashrc
RUN git clone https://github.com/tum-vision/lsd_slam.git ~/rosbuild_ws/package_dir/lsd_slam
RUN rosdep update
RUN bash -c "source ~/.bashrc && cd ~/rosbuild_ws/package_dir && rosmake lsd_slam"

COPY ./LSD_room.bag.zip /home/ros