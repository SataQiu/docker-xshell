#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

DATA_DIR="/tmp/NetSarang"
if [[ ! -d ${DATA_DIR} ]]; then
  mkdir -p ${DATA_DIR}
fi

xhost +

docker run --rm -it \
  -v ${DATA_DIR}:/home/wine/.wine/drive_c/users/wine/'Application Data'/NetSarang \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=unix$DISPLAY \
  -e XMODIFIERS=@im=fcitx \
  -e GTK_IM_MODULE=fcitx \
  -e QT_IM_MODULE=fcitx \
  --ipc=host \
  --privileged \
  xshell:4.0
