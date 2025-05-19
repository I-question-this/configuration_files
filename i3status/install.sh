#!/bin/sh

if [ ! $# -eq 1 ]; then
  echo "Must include config to install as argument"
  exit 1
fi


mkdir -p ~/.config/i3status
ln -sf $(realpath ./any_position_wrapper.sh) ~/.config/i3status
ln -sf $(realpath $1) ~/.config/i3status/config
