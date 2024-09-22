ARG ROS_DISTRO=rolling
FROM ros:$ROS_DISTRO-ros-base as mwe

ENV DEBIAN_FRONTEND=noninteractive

ARG USERNAME=ubuntu
USER ${USERNAME}

CMD "echo \"Hello world!\""