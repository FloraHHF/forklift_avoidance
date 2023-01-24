forklift_avoidance
===========

# Disclaimer

The forklift_avoidance package is only tested under ROS Melodic (Ubuntu 18.04). 

This is an ongoing project, therefore the code is subjected to frequent changes. 

# Package Overview

This package is for the simulation where a P230 drone (developed by [AmovLab](https://www.amovlab.com/)) navigates through an aisle made by shelves in an warehouse, while avoiding working forklifts. 

This package is dependent on [Prometheus](https://gitee.com/amovlab/Prometheus) for the modelling and control of P230, on [aws-robomaker-small-warehouse-world](https://github.com/aws-robotics/aws-robomaker-small-warehouse-world) for the warehouse modelling, on [gazebo_dvs_plugin](https://github.com/HBPNeurorobotics/gazebo_dvs_plugin) for the event camera gazebo plugin, and on [rpg_dvs_ros](https://github.com/uzh-rpg/rpg_dvs_ros) for the event renderer. 

Author: Flora Fu

# Installation

1. Install Prometheus. Please follow the instructions [here](https://wiki.amovlab.com/public/prometheus-wiki/). Prometheus depends on modified versions of px4 and mavros, be sure to follow the instructions above exactly.

Install `libcaer`, following the instruction from [iniVation documentation](https://inivation.gitlab.io/dv/dv-docs/docs/getting-started.html#ubuntu-linux). `libcaer` is a dependency of rpg_dvs_ros.


2. Create a [catkin workspace](http://wiki.ros.org/catkin/Tutorials/create_a_workspace) to put all the other dependencies other than Prometheus (you can change name catkin_ws with any other name):
*   `$ cd`
*   `$ mkdir -p catkin_ws/src`

3. Clone the [aws-robomaker-small-warehouse-world](https://github.com/aws-robotics/aws-robomaker-small-warehouse-world) package into your workspace:
*   `$ cd ~/catkin_ws/src`
*   `$ git clone https://github.com/aws-robotics/aws-robomaker-small-warehouse-world`

4. Clone the forklift_avoidance package:
*   `$ cd ~/catkin_ws/src`
*   `$ git clone https://github.com/FloraHHF/forklift_avoidance.git`

5. Clone the [gazebo_dvs_plugin](https://github.com/HBPNeurorobotics/gazebo_dvs_plugin) package into the workspace:
*   `$ cd ~/catkin_ws/src`
*   `$ git clone https://github.com/HBPNeurorobotics/gazebo_dvs_plugin`

6. Clone the [rpg_dvs_ros](https://github.com/uzh-rpg/rpg_dvs_ros) package into the workspace:
*   `$ cd ~/catkin_ws/src`
*   `$ git clone https://github.com/HBPNeurorobotics/gazebo_dvs_plugin`

7. [rpg_dvs_ros](https://github.com/uzh-rpg/rpg_dvs_ros) depends on [catkin_simple](https://github.com/catkin/catkin_simple) package to build, therefore clone it into the workspace:
*   `$ cd ~/catkin_ws/src`
*   `$ git clone https://github.com/catkin/catkin_simple.git`

8. Add the following lines into .bashrc. 
    1. for the `P230 with an event camera` model to be found:
        *   `export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/catkin_ws/src/forklift_avoidance/models`
    2. for the gazeb event camera plugin to be found:
        *   `export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:~/catkin_ws/devel/lib`
    3. for the Prometheus customized messages to be found. Note this is necessary because Prometheus is not in the current workspace. 
        *   `export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:~/prometheus_px4:~/prometheus_mavros`
        *   `export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:~/Prometheus`

9. Build the workspace:
*   `$ cd catkin_ws`
*   `$ catkin_make`

10. Source the workspace. Add the following to .bashrc
    *   `$ source (path to catkin_ws)/devel/setup.bash` 

10. Install `QGroundControl` following the instruction [here](https://docs.qgroundcontrol.com/master/en/getting_started/download_and_install.html).

# Usage

1. Open QGroundControl

2. Open a new terminal, navigate to 
*   `$ cd (path to catkin_ws)/src/forklift_avoidance/sh`

3. make p230_in_warehouse.sh executable if it is not:
*   `$ chmod +x p230_in_warehouse.sh`

4. run p230_in_warehouse.sh:
*   `$ ./p230_in_warehouse.sh`

5. In QGroundControl, go to application settings>general>tick `Virtual Joystick`

6. Arm the drone from QGroundControl, then you should be able to control P230 using the virtual joystick and view the event camera output. The result is shown below
https://user-images.githubusercontent.com/108480783/214370080-d294117f-2b4a-4fb5-a448-d6bfd04e8ff5.mp4


