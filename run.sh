#!/usr/bin/env bash

set -e

export DOCKER_EXEC="${DOCKER_EXEC:-"${SUDO_EXEC} docker"}"

mkdir -p $HOME/.local/share/x11docker

if [[ ! -f ./tini-static ]]
then
  wget -o $HOME/.local/share/x11docker/tini-static https://github.com/krallin/tini/releases/download/v0.18.0/tini-static
  chmod +x $HOME/.local/share/x11docker/tini-static
fi

$DOCKER_EXEC build -t x11docker-vpn ./vpn-docker/

$SUDO_EXEC x11docker --verbose --auto --xc=auto --share /dev/net/tun --user=1000:100 -- --cap-add=NET_ADMIN -- x11docker-vpn:latest google-chrome
