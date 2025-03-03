FROM python:3.11

ARG DEBIAN_FRONTEND=noninteractive

# create a non-root user
ARG USERNAME=ubuntu
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && mkdir /home/$USERNAME/.config && chown $USER_UID:$USER_GID /home/$USERNAME/.config

# set up sudo privileges
RUN apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    && chmod 0440 /etc/sudoers.d/$USERNAME

# base utils
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
    python3-argcomplete

# ===== YOLO 11 =====
# ultralytics install
# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_BREAK_SYSTEM_PACKAGES=1

# Downloads to user config dir
ADD https://github.com/ultralytics/assets/releases/download/v0.0.0/Arial.ttf \
    https://github.com/ultralytics/assets/releases/download/v0.0.0/Arial.Unicode.ttf \
    /root/.config/Ultralytics/

# Install linux packages
# g++ required to build 'tflite_support' and 'lap' packages, libusb-1.0-0 required for 'tflite_support' package
RUN apt-get install -y --no-install-recommends \
    htop libgl1 libglib2.0-0 libpython3-dev gnupg g++ libusb-1.0-0 

# Create working directory
WORKDIR /ultralytics

# Copy contents and configure git
COPY ultralytics .
ADD https://github.com/ultralytics/assets/releases/download/v8.3.0/yolo11n.pt .

# Install pip packages
RUN pip install uv
RUN uv pip install --system -e ".[export]" --extra-index-url https://download.pytorch.org/whl/cpu --index-strategy unsafe-first-match

# Run exports to AutoInstall packages
RUN yolo export model=tmp/yolo11n.pt format=edgetpu imgsz=32
RUN yolo export model=tmp/yolo11n.pt format=ncnn imgsz=32
# Requires Python<=3.10, bug with paddlepaddle==2.5.0 https://github.com/PaddlePaddle/X2Paddle/issues/991
RUN uv pip install --system "paddlepaddle>=2.6.0" x2paddle

# Remove extra build files
RUN rm -rf tmp /root/.config/Ultralytics/persistent_cache.json

WORKDIR /

# jupyter
RUN pip install ipython ipykernel

# ===== END YOLO 11 =====

# ===== ORB-SLAM3 =====
# OpenCV

# prerequisites
RUN apt-get install -y cmake  g++

# Deps to fix opencv error when run orb-slam3
RUN apt-get install -y libgtk2.0-dev pkg-config

# download and unpack sources
RUN wget -O opencv.zip https://github.com/opencv/opencv/archive/4.8.0.zip \
    && unzip opencv.zip \
    && mv opencv-4.8.0 opencv \
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

# Pangolin
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
    && ./scripts/Pangolin_install_prerequisites_patch.sh recommended
    
# # configure and build
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

# eigen sources
RUN wget -O eigen.zip https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.zip \
    && unzip /eigen.zip \
    && cp -r /eigen-3.4.0/Eigen /usr/local/include \
    && rm /eigen.zip \
    && rm -rf /eigen-3.4.0

# specific python version 
# RUN apt-get install -y libpython2.7-dev

# Deps for building orb-slam3
RUN sudo apt-get update && sudo apt-get install -y libboost-dev libboost-serialization-dev && rm -rf /var/lib/apt/lists/* 

# TODO: move to the yolo section
RUN pip install numpy

# orbslam build script
RUN mkdir /scripts 
COPY scripts/build_orb_slam3.sh /scripts
RUN sudo chmod +x /scripts/build_orb_slam3.sh

# ===== END ORB-SLAM3 =====

# Remove folder in order to ensure to run apt-get update before installing new package 
# (without this folder 'apt-get update' will not work)
RUN rm -rf /var/lib/apt/lists/*
# switch from root to user
USER $USERNAME
# add user to video group to allow access to webcam
RUN sudo usermod --append --groups video $USERNAME

ENV LANG=en_US.UTF-8

CMD ["bash"]