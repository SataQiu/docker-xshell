#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

# build the base image
docker build -t xshell:base -f Dockerfile.base .

# install xshell package
xhost +
docker run --name xshell-base -it \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=unix$DISPLAY \
  -e XMODIFIERS=@im=fcitx \
  -e GTK_IM_MODULE=fcitx \
  -e QT_IM_MODULE=fcitx \
  --ipc=host \
  --privileged \
  xshell:base

# commit xshell container as an image
docker commit xshell-base xshell:base-tmp

# build final image
docker build -t xshell:4.0 .

# clean rubbish
docker rm -f xshell-base
docker rmi -f xshell:base xshell:base-tmp
