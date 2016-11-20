FROM ros:indigo-ros-core

RUN apt-get -y update

RUN apt-get -y install ros-indigo-image-pipeline
RUN apt-get -y install ros-indigo-ros-tutorials

# ZeroTier
RUN curl https://install.zerotier.com/ | bash 
EXPOSE 9993
# Allows to keep the same id between runs
VOLUME /var/lib/zerotier-one

# XWindows access
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

COPY ./docker-entrypoint.sh /

USER ros
ENV HOME /home/ros

ENTRYPOINT ["/docker-entrypoint.sh"]