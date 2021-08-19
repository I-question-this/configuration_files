#!/bin/bash

charge_start_threshold_file=/sys/class/power_supply/BAT0/charge_start_threshold
charge_start_control_threshold_file=/sys/class/power_supply/BAT0/charge_control_start_threshold
charge_stop_threshold_file=/sys/class/power_supply/BAT0/charge_stop_threshold
charge_stop_control_threshold_file=/sys/class/power_supply/BAT0/charge_control_stop_threshold

if [ "$EUID" -ne 0 ]; then
  echo "$0 must be run as root"
  exit 2
fi

if [ -z "$1" ]; then
  echo "Usage: $0 <start/stop> <new_threshold>"
  echo "Pass no second parameter to see the current threshold."
  exit 0
elif [ -z "$2" ]; then
  if [ $1 = "start" ]; then
    echo -n "Current start threshold: "
    cat $charge_start_threshold_file
    exit 0
  elif [ $1 = "stop" ]; then
    echo -n "Current stop threshold: "
    cat $charge_stop_threshold_file
    exit 0
  else
    echo "$1 is not start or stop"
    exit 1
  fi
elif [ -z "$3" ]; then
  if [ $1 = "start" ]; then
    echo $2 > $charge_start_threshold_file
    echo $2 > $charge_start_control_threshold_file
    echo -n "Start threshold is now: "
    cat $charge_start_threshold_file
    exit 0
  elif [ $1 = "stop" ]; then
    echo $2 > $charge_stop_threshold_file
    echo $2 > $charge_stop_control_threshold_file
    echo -n "Stop threshold is now: "
    cat $charge_stop_threshold_file
    exit 0
  else
    echo "$1 is not start or stop"
    exit 1
  fi
fi
