FROM osrf/ros:noetic-desktop-full

ARG ROS_DISTRO=noetic
ARG DEBIAN_FRONTEND=noninteractive

# base utils
RUN apt-get update && apt-get install -y vim git wget curl python3-pip x11-apps \
    # Autocomplete
    bash-completion \
    python3-argcomplete \
    # Remove folder in order to ensure to run apt-get update before installing new package 
    # (without this folder 'apt-get update' will not work)
    && rm -rf /var/lib/apt/lists/*

# create a non-root user
ARG USERNAME=ros
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && mkdir /home/$USERNAME/.config && chown $USER_UID:$USER_GID /home/$USERNAME/.config

# set up sudo privileges
RUN apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && rm -rf /var/lib/apt/lists/*

# opencv minimal prerequisites
RUN apt-get update && apt-get install -y cmake g++ wget unzip \
    && rm -rf /var/lib/apt/lists/*

# download and unpack sources
RUN wget -O opencv.zip https://github.com/opencv/opencv/archive/4.4.0.zip \
    && unzip opencv.zip \
    && mv opencv-4.4.0 opencv \
    && rm opencv.zip

# build
RUN mkdir -p /opencv_build \
    && cd /opencv_build \
    && cmake ../opencv \
    && make -j4 

# install, remove source/build files
RUN cd /opencv_build \
    && sudo make install \
    && cd .. \
    && rm -rf /opencv /opencv_build

# pangolin sources
RUN git clone --recursive https://github.com/stevenlovegrove/Pangolin.git 
# The master branch is a development branch. Choose a stable tag if you prefer.

# install deps
RUN git clone https://github.com/catchorg/Catch2.git \
    && cd Catch2 \
    && cmake -B build -S . -DBUILD_TESTING=OFF \
    && sudo cmake --build build/ --target install \
    && cd .. \
    && rm -rf /Catch2

COPY scripts/Pangolin_install_prerequisites_patch.sh /Pangolin/scripts
RUN sudo chmod +x /Pangolin/scripts/Pangolin_install_prerequisites_patch.sh 

RUN cd /Pangolin \
    && sudo apt-get update \ 
    && ./scripts/Pangolin_install_prerequisites_patch.sh recommended \
    && rm -rf /var/lib/apt/lists/*

# configure and build
RUN cd /Pangolin \
    && cmake -B build \
    && cmake --build build

# install
RUN cd /Pangolin/build \
    && cmake .. \
    && sudo make install \
    && cd ../../ \
    && rm -rf /Pangolin

# RUN cd /Pangolin && cmake -B build -D BUILD_TESTS=ON && cd build && ctest # configure to run with tests
# RUN cd /Pangolin && cmake --build build -t pypangolin_pip_install # Check the output to verify selected python version

# eigen sources
RUN wget -O eigen.zip https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.zip \
    && unzip /eigen.zip \
    && cp -r /eigen-3.4.0/Eigen /usr/local/include \
    && rm /eigen.zip \
    && rm -rf /eigen-3.4.0

# python 
RUN sudo apt-get update \
    && sudo apt-get install -y libpython2.7-dev

# scripts for initialization and orbslam build
RUN mkdir /scripts 
COPY scripts/build_orb_slam3.sh /scripts
COPY scripts/ros_entrypoint.sh /scripts
RUN sudo chmod +x /scripts/build_orb_slam3.sh /scripts/ros_entrypoint.sh

COPY scripts/bashrc /home/${USERNAME}/bashrc
RUN cat /home/${USERNAME}/bashrc >> /home/${USERNAME}/.bashrc && rm /home/${USERNAME}/bashrc

# switch from root to user
USER $USERNAME
# add user to video group to allow access to webcam
RUN sudo usermod --append --groups video $USERNAME

ENV ROS_DISTRO=${ROS_DISTRO}
ENV LANG=en_US.UTF-8

ENTRYPOINT ["/bin/bash", "/scripts/ros_entrypoint.sh"]
CMD ["bash"]