# Use Melodic version 
FROM ros:melodic-ros-core-bionic

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    && rm -rf /var/lib/apt/lists/*

ARG WORKSPACE=/opt/ros/runner_test_pkg

COPY ./runner_test_pkg  ${WORKSPACE}/src

RUN . /opt/ros/$ROS_DISTRO/setup.sh && \
    apt-get update && rosdep install -y \
      --from-paths \
        /opt/ros/runner_test_pkg \
      --ignore-src \
    && rm -rf /var/lib/apt/lists/*


