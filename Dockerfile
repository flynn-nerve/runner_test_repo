# Use Melodic version 
FROM ros:melodic-ros-core-bionic

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

# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-melodic-ros-base=1.4.1-0* \
    && rm -rf /var/lib/apt/lists/*
    
ARG WORKSPACE=/tmp/WORKSPACE/src
WORKDIR ${WORKSPACE}
COPY . ${WORKSPACE}

RUN . /opt/ros/$ROS_DISTRO/setup.sh && \
    apt-get update && rosdep install -y \
      --from-paths \
        runner_test_pkg \
    && rm -rf /var/lib/apt/lists/*



RUN bash -c "catkin init"
RUN bash -c "catkin build"
RUN bash -c "source /deve/setup.bash"


