#!/bin/bash
# This scripts launches a P230 model in warehouse

# roscore
gnome-terminal --window -e 'bash -c "roscore; exec bash"' \
--tab -e 'bash -c "sleep 5; roslaunch forklift_avoidance sitl_p230.launch; exec bash"' \
--tab -e 'bash -c "sleep 6; roslaunch forklift_avoidance uav_controller.launch; exec bash"' \
--tab -e 'bash -c "sleep 7; rosrun forklift_avoidance takeoff_land.py; exec bash"' \
