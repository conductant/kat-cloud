#!/bin/bash

set -o errexit -o nounset -o xtrace

sudo apt-get install -y zookeeperd

# TODO(wfarner): Configure quorum, zoo.conf, etc.