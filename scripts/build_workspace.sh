#!/usr/bin/env bash

# NOTE: Simulate entrypoint of final docker image
source "/opt/ros/$ROS_DISTRO/setup.bash"

cd $ROS_WORKDIR &&
    catkin_make
