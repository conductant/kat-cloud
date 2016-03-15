#!/bin/bash

set -o errexit -o nounset -o xtrace

if [[ "$(whoami)" != "root" ]]
then
  echo "Switching to root."
  exec sudo -E -- "$0" "$@"
fi

DEB_URL='http://downloads.mesosphere.io/master/ubuntu/14.04/mesos_0.25.0-0.2.70.ubuntu1404_amd64.deb'
DEB_SHA256=55931ce0533a26e4b4c57696a5c7dd80dd3b1c8b27f3bf8d7701a7321a457174

function install_mesos_deps {
  apt-get install -y \
    libapr1-dev \
    libcurl4-openssl-dev \
    libsvn-dev
}

function install_mesos {
  deb_file=$(basename $DEB_URL)
  wget "$DEB_URL"
  echo "$DEB_SHA256 $deb_file" | sha256sum -c
  dpkg -i "$deb_file"
  rm "$deb_file"
}

install_mesos_deps
install_mesos
