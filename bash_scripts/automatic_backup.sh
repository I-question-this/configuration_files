#!/bin/bash

# Create the currebt date
DATE=$(date +%Y-%m-%d-%H-%M-%S)

# VirtualBox Daily SnapShot
VBoxManage snapshot "git_server" take "DailySnapShot -- $DATE" --description "Daily Snap Shot -- $DATE"

# Remove Extra Daily SnapShots
for uuid in $(vbox_manage_extra_daily_snapshots.py "git_server");
    do VBoxManage snapshot "git_server" delete $uuid;
done

# Unison back up of hone directory
unison home_to_backup -auto -batch -silent -logfile /var/log/unison/home_to_backup.log
