# docker-xshell

Run XShell in Docker container

##  Prepare

For Ubuntu, please ensure that x11-server has been installed:

```sh
$ sudo apt-get install x11-xserver-utils
$ xhost +
```

For MacOS, TBD...

## Quick Start

```sh
$ docker run --rm -it \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=unix$DISPLAY \
  -e XMODIFIERS=@im=fcitx \
  -e GTK_IM_MODULE=fcitx \
  -e QT_IM_MODULE=fcitx \
  --ipc=host \
  --privileged \
  shidaqiu/xshell:4.0
```

## Build

```sh
$ bash build.sh
```

## Run

```sh
$ bash run.sh
```

![](imgs/demo.png)