FROM ultralytics/ultralytics:latest-cpu

ARG DEBIAN_FRONTEND=noninteractive

# base utils
RUN apt-get update && apt-get install -y vim git wget curl python3 python3-pip x11-apps \
    # Autocomplete
    bash-completion \
    python3-argcomplete \
    # Remove folder in order to ensure to run apt-get update before installing new package 
    # (without this folder 'apt-get update' will not work)
    && rm -rf /var/lib/apt/lists/*

# create a non-root user
ARG USERNAME=dl
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

# switch from root to user
USER $USERNAME
# add user to video group to allow access to webcam
RUN sudo usermod --append --groups video $USERNAME

ENV LANG=en_US.UTF-8

CMD ["bash"]
