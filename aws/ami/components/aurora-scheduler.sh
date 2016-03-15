#!/bin/bash

set -o errexit -o nounset -o xtrace

if [[ "$(whoami)" != "root" ]]
then
  echo "Switching to root."
  exec sudo -E -- "$0" "$@"
fi

DEB_URL='https://bintray.com/artifact/download/apache/aurora/ubuntu-trusty/aurora-scheduler_0.12.0_amd64.deb'
DEB_SHA256=bdd0c666a56d175d663084b27eeb17d17639266d9805b3cef1b0195220ae75f5

apt-get update
deb_file=$(basename $DEB_URL)
wget "$DEB_URL"
echo "$DEB_SHA256 $deb_file" | sha256sum -c
dpkg -i "$deb_file"
rm "$deb_file"
