#!/bin/bash
cd $(dirname $0)
ln $(realpath biggamer.nvidia-settings-rc) ~/.nvidia-settings-rc
sudo cp xorg.conf /etc/X11/xorg.conf
