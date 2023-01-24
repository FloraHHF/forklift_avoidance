#!/bin/bash
# This scripts launches a P230 model in warehouse

# TODO:
# 1. launch by  "prometheus_gazebo   sitl_indoor_1uav.launch" with arguments,
# 	 instead of "forklift_avoidance  sitl_p230.launch
# 2. launch by  "roslaunch prometheus_uav_control  uav_control_main_outdoor.launch" with arguments,
#    instead of "forklift_avoidance                uav_controller.launch"

gnome-terminal \
--window -e 'bash -c "roscore; exec bash"' \
--tab -e 'bash -c "sleep 5; roslaunch forklift_avoidance sitl_p230.launch; exec bash"' \
--tab -e 'bash -c "sleep 6; roslaunch forklift_avoidance uav_controller.launch; exec bash"' \
--tab -e 'bash -c "sleep 7; rosrun forklift_avoidance takeoff_land.py; exec bash"' \
--tab -e 'bash -c "sleep 8; roslaunch forklift_avoidance davis_render.launch; exec bash"' \