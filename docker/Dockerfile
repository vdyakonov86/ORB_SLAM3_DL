FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive
# create a non-root user
ARG USERNAME
ARG BUILD_CONTEXT_PATH
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ENV LANG=en_US.UTF-8

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && mkdir /home/$USERNAME/.config && chown $USER_UID:$USER_GID /home/$USERNAME/.config

# set up sudo privileges
RUN apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    && chmod 0440 /etc/sudoers.d/$USERNAME

# add user to video group to allow access to webcam
RUN usermod --append --groups video $USERNAME

# base utils
# TODO: add --no-install-recommends 
RUN apt-get install -y \
    vim \
    git \
    wget \
    curl \
    zip \
    unzip \
    python3-pip \
    x11-apps \
    # Autocomplete
    bash-completion \
    python3-argcomplete \
    cmake \
    g++

# --- OpenCV
# fix: OpenCV(4.9.0) /opencv/modules/highgui/src/window.cpp:1272: error: (-2:Unspecified error) The function is not implemented.
RUN apt-get install -y libgtk2.0-dev pkg-config

# download and unpack sources
RUN wget -O opencv.zip https://github.com/opencv/opencv/archive/4.9.0.zip \
    && unzip opencv.zip \
    && mv opencv-4.9.0 opencv \
    && rm opencv.zip

# build
RUN mkdir -p /opencv_build \
    && cd /opencv_build \
    && cmake -DBUILD_TESTS=OFF ../opencv \
    && make -j4

# install, remove source/build files
RUN cd /opencv_build \
    && sudo make install \
    && cd .. \
    && rm -rf /opencv /opencv_build
# --- End OpenCV
    
# --- Pangolin
RUN git clone --recursive https://github.com/stevenlovegrove/Pangolin.git 
# The master branch is a development branch. Choose a stable tag if you prefer.

# install deps
RUN git clone https://github.com/catchorg/Catch2.git \
    && cd Catch2 \
    && cmake -B build -S . -DBUILD_TESTING=OFF \
    && sudo cmake --build build/ --target install \
    && cd .. \
    && rm -rf /Catch2

# fix Pangoling depds installation
COPY ${BUILD_CONTEXT_PATH}/scripts/Pangolin_install_prerequisites_patch.sh /Pangolin/scripts
RUN sudo chmod +x /Pangolin/scripts/Pangolin_install_prerequisites_patch.sh 

RUN cd /Pangolin \
    && ./scripts/Pangolin_install_prerequisites_patch.sh recommended
    
# # configure nad build
# RUN cd /Pangolin \
#     && cmake -B build \
#     && cmake -DBUILD_PANGOLIN_LIBOPENEXR=OFF --build build

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
# --- End Pangolin

# --- Eigen
# download and unpack sources, there is no need to install
RUN wget -O eigen.zip https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.zip \
    && unzip /eigen.zip \
    && cp -r /eigen-3.4.0/Eigen /usr/local/include \
    && rm /eigen.zip \
    && rm -rf /eigen-3.4.0
# --- End Eigen

# --- ORB-SLAM3
# deps for building
RUN apt-get install -y libboost-dev libboost-serialization-dev
# fix error openssl-opensslv
RUN apt-get install -y libssl-dev

# build
RUN mkdir /scripts
COPY ${BUILD_CONTEXT_PATH}/scripts/build_orb_slam3.sh /scripts
RUN sudo chmod +x /scripts/build_orb_slam3.sh
# --- End ORB-SLAM3

# onnx_runtime_cpp
RUN apt-get update && apt-get install -y --no-install-recommends libopencv-dev
# newer cmake version
RUN apt-get -y purge cmake && sudo pip install cmake==3.25.0

RUN apt-get update
RUN apt-get install -y libboost-all-dev libboost-serialization-dev

RUN pip install numpy matplotlib

COPY ${BUILD_CONTEXT_PATH}/scripts/.bashrc /home/${USERNAME}/bashrc
RUN cat /home/${USERNAME}/bashrc >> /home/${USERNAME}/.bashrc && rm /home/${USERNAME}/bashrc

# switch from root to user
USER $USERNAME
CMD ["bash"]