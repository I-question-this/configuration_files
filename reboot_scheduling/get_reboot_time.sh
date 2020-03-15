#!/bin/bash

# Taken from the comments of:
# https://unix.stackexchange.com/a/229759

USECS=$(busctl get-property org.freedesktop.login1 /org/freedesktop/login1 org.freedesktop.login1.Manager ScheduledShutdown | cut -d ' ' -f 3);
SECS=$((USECS / 1000000));

if [ $SECS -eq 0 ]; then
  echo "No reboot is scheduled"
else
  echo "Reboot is scheduled at $(date --date=@$SECS)"
fi
