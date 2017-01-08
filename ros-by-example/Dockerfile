FROM ros-indigo-zt

RUN sudo apt-get -y update

RUN sudo apt-get -y install ros-indigo-turtlebot-bringup \
ros-indigo-turtlebot-create-desktop ros-indigo-openni-* \
ros-indigo-openni2-* ros-indigo-freenect-* ros-indigo-usb-cam \
ros-indigo-laser-* ros-indigo-hokuyo-node \
ros-indigo-audio-common gstreamer0.10-pocketsphinx \
ros-indigo-pocketsphinx ros-indigo-slam-gmapping \
ros-indigo-joystick-drivers python-rosinstall \
ros-indigo-orocos-kdl ros-indigo-python-orocos-kdl \
python-setuptools ros-indigo-dynamixel-motor-* \
libopencv-dev python-opencv ros-indigo-vision-opencv \
ros-indigo-depthimage-to-laserscan ros-indigo-arbotix-* \
ros-indigo-turtlebot-teleop ros-indigo-move-base \
ros-indigo-map-server ros-indigo-fake-localization \
ros-indigo-amcl ros-indigo-rqt-reconfigure git subversion mercurial \
ros-indigo-controller-manager

RUN mkdir -p ~/catkin-ws/src
RUN git clone https://github.com/pirobot/rbx1.git ~/catkin-ws/src/rbx1
RUN cd ~/catkin-ws/src/rbx1 && git checkout indigo-devel
RUN bash -c "source /ros_entrypoint.sh && cd ~/catkin-ws && catkin_make"
RUN bash -c "source ~/catkin-ws/devel/setup.bash && cd ~/catkin-ws && rospack profile"
RUN echo "source ~/catkin-ws/devel/setup.bash" | tee >> ~/.bashrc

COPY ./ev3_launch /home/ros/catkin-ws/src/ev3_launch
