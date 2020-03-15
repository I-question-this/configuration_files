#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "$0 must be run as root"
  exit 1
fi

# Calculate minutes to reboot
reboot_date_seconds=$(date -d "next Sunday" "+%s")
now_date_seconds=$(date -d "now" "+%s")
minutes_til_reboot=$(echo "($reboot_date_seconds - $now_date_seconds)/60.0" | bc)
# Schedule the reboot
shutdown -r +$minutes_til_reboot
