FROM ros:indigo-ros-core

RUN apt-get -y update

RUN apt-get -y install ros-indigo-image-pipeline

# ZeroTier
RUN curl https://install.zerotier.com/ | bash 

EXPOSE 9993

# Allows to keep the same id between runs
VOLUME /var/lib/zerotier-one


# IMPORTANT: Update to the `id -u` value on your computer
ENV uid 1000 
# IMPORTANT: Update to the `id -g` value on your computer
ENV gid 1000 

RUN export uid=${uid} gid=${gid} && \
    mkdir -p /home/ros && \
    echo "ros:x:${uid}:${gid}:ros,,,:/home/ros:/bin/bash" >> /etc/passwd && \
    echo "ros:x:${uid}:" >> /etc/group && \
    echo "ros ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ros && \
    chmod 0440 /etc/sudoers.d/ros && \
    chown ${uid}:${gid} -R /home/ros

USER ros
ENV HOME /home/ros

# TODO create a start.sh with the join
# TODO ARG does not seem to do anything ?
CMD sudo service zerotier-one start && sudo zerotier-cli join 565799d8f6f7f87f && bash