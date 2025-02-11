#!/bin/bash
xhost +local:

IMG_NAME=$1
CONTAINER_NAME=$2
PROJECT_NAME="${3:-"new_project"}"

# The directory from which script has been run
SIM_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
echo "Path to volume folder: ${SIM_ROOT}/ros_ws"

docker run  -it \
            --rm \
            -e "DISPLAY" \
            -e "QT_X11_NO_MITSHM=1" \
            -e XAUTHORITY \
            -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
            -v /etc/localtime:/etc/localtime:ro \
            -v ${SIM_ROOT}/ros_ws:/ros_ws \
            -v ${SIM_ROOT}/ORB_SLAM3:/ORB_SLAM3 \
            -v ${SIM_ROOT}/Datasets:/Datasets \
            -v /dev:/dev \
            --device-cgroup-rule='c *:* rmw' \
            --network=host \
            --ipc=host \
            --name ${CONTAINER_NAME} ${IMG_NAME}
            # Unnecessary things
            # -e "QT_X11_NO_MITSHM=1" \
            # -e XAUTHORITY \
