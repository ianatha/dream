#!/bin/sh
#
# Start the docker container which will keep looking for images inside
# the inputs/ directory and spew out results into outputs/

PORT=80
# DOCKER_NVIDIA_DEVICES="--device /dev/nvidia0:/dev/nvidia0 --device /dev/nvidiactl:/dev/nvidiactl --device /dev/nvidia-uvm:/dev/nvidia-uvm"
docker run  --restart=always --name deepdream-files -v `pwd`/deepdream:/usr/share/nginx/html:ro -d -p ${PORT}:80 nginx
docker run  --restart=always --name deepdream-compute $DOCKER_NVIDIA_DEVICES -v `pwd`/deepdream:/opt/deepdream -d dream /bin/bash -c "cd /opt/deepdream && ./process_images.sh"
