#!/bin/bash

# install dependencies
sudo dnf install -y openssl-devel redhat-rpm-config python-devel libtool clang

cd /tmp
git clone https://github.com/facebook/watchman.git
cd watchman

# Configures stuff
./autogen.sh
./configure

# this uses all cpu cores for building
make -j$(ls -1d /sys/devices/system/cpu/cpu[0-9]* | wc -l)
# must be executed as root
sudo make install

exit 0
# the folder can be removed at the end
cd ~
sudo rm -Rf /tmp/watchman
