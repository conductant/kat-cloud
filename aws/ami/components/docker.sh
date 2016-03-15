#!/bin/bash

set -o errexit -o nounset -o xtrace

if [[ "$(whoami)" != "root" ]]
then
  echo "Switching to root."
  exec sudo -E -- "$0" "$@"
fi

export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get install -y apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
  --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' \
  > /etc/apt/sources.list.d/docker.list
apt-get update

apt-get install -y linux-image-extra-$(uname -r) \
  docker-engine
