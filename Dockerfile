# Use Melodic version 
FROM ros:melodic-ros-core-bionic


ARG OVERLAY_WS=/opt/ros/overlay_ws

WORKDIR $OVERLAY_WS/src
COPY ./runner_test_pkg  ${OVERLAY_WS}/src


WORKDIR ${OVERLAY_WS}/src
COPY .setup.sh  ${OVERLAY_WS}/src/runner_test_pkg/

