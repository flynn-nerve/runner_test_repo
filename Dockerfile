# Use Melodic version 
FROM ros:melodic-ros-base

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    && rm -rf /var/lib/apt/lists/*

# bootstrap rosdep
RUN rosdep init && \
  rosdep update --rosdistro $ROS_DISTRO


ARG PACKAGE_PATH=/opt/ros/runner_test_pkg

COPY ./runner_test_pkg  ${PACKAGE_PATH}/src

RUN . /opt/ros/$ROS_DISTRO/setup.sh && \
    apt-get update && rosdep install -y \
      --from-paths \
        /opt/ros/runner_test_pkg \
      --ignore-src \
    && rm -rf /var/lib/apt/lists/*

ARG WORKSPACE=/tmp/WORKSPACE/src
WORKDIR ${WORKSPACE}

RUN bash -c "catkin init"
RUN bash -c "catkin build"
RUN bash -c "source /deve/setup.bash"


