#!/usr/bin/env bash

# Start the refbox-client if no arguments are provided
if [ -z "$1" ]; then
    cd $ROS_WORKDIR &&
        source devel/setup.bash &&
        roscd atwork_refbox_ros_client &&
        roslaunch ros/launch/robot_example_ros.launch
    exit 0
fi

eval $@
