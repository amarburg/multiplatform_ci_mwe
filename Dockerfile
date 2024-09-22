ARG ROS_DISTRO=rolling
FROM ros:$ROS_DISTRO-ros-base AS mwe

ENV DEBIAN_FRONTEND=noninteractive

ARG USERNAME=ubuntu
USER ${USERNAME}

CMD ["echo", "\"Hello world!\"" ]
