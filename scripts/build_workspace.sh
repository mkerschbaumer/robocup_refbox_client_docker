#!/usr/bin/env bash

# NOTE: Simulate entrypoint of final docker image
source "/opt/ros/$ROS_DISTRO/setup.bash"

cd $ROS_WORKDIR &&
    # only build refbox_comm
    mv src/atwork_refbox_ros_client/ . &&
    catkin_make &&
    # Compile client
    mv atwork_refbox_ros_client src/ &&
    catkin_make
