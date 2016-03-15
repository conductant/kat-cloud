#!/bin/bash

set -o errexit -o nounset -o xtrace

if [[ "$(whoami)" != "root" ]]
then
  echo "Switching to root."
  exec sudo -E -- "$0" "$@"
fi

apt-get install -y software-properties-common
add-apt-repository ppa:openjdk-r/ppa -y
apt-get update
apt-get install -y openjdk-8-jre
update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java