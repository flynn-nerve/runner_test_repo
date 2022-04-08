#!/bin/bash

WORKSPACE=$1

if [ -z $1 ]
  then
    echo "No desired workspace name supplied, please re-run the script"
    echo "Your command should look like ./setup.sh <workspace_name>"
    echo "For example; ./setup.sh catkin_ws"
    exit
fi

cd ~/$WORKSPACE
source devel/setup.bash
catkin init
catkin build


