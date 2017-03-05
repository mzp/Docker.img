#!/bin/sh

function abort() {
  echo $@ >&2
  exit 1
}

DOCKER_ROOT=/Applications/Docker.app
HYPERKIT=$DOCKER_ROOT/Contents/MacOS/com.docker.hyperkit

if [ ! -e $DOCKER_ROOT ]; then
  abort "Docker for Mac is not installed."
fi

if [ ! -e $HYPERKIT.original ]; then
  mv $HYPERKIT $HYPERKIT.original
fi

curl -o $HYPERKIT https://raw.githubusercontent.com/mzp/Docker.img/master/com.docker.hyperkit
chmod a+x $HYPERKIT

