#!/bin/bash
sudo service zerotier-one start
: "${ZT_NETWORK:?Need to set ZT_NETWORK}"
sudo zerotier-cli join $ZT_NETWORK
source ros_entrypoint.sh
bash -c "$1"
