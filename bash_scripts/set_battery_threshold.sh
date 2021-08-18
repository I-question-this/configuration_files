#!/bin/bash

charge_stop_threshold_file=/sys/class/power_supply/BAT0/charge_stop_threshold

if [ "$EUID" -ne 0 ]; then
  echo "$0 must be run as root"
  exit 2
fi

if [ -z "$1" ]; then
  echo -n "Current stop threshold: "
  cat $charge_stop_threshold_file
  exit 1
elif [ -z "$2" ]; then
  echo $1 > $charge_stop_threshold_file
else
  echo "Usage: $0 <new_threshold>"
  echo "Pass no parameters to see current threshold"
  exit 1
fi
