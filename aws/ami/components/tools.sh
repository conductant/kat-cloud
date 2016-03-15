#!/bin/bash

set -o errexit -o nounset -o xtrace

sudo apt-get update
sudo apt-get install -y wget