#!/bin/bash

# Create the currebt date
DATE=$(date +%Y-%m-%d-%H-%M-%S)

# Logfiles
UNISON_LOGFILE=/var/log/unison/home_to_backup.log
VBOX_LOGFILE=/var/log/vbox/git_server_snapshot.log

# Put Date into VBOX_LOGFILE
echo Backup Process Began -- $DATE >> $VBOX_LOGFILE

# VirtualBox Daily SnapShot
VBoxManage snapshot "git_server" take "DailySnapShot -- $DATE" --description "Daily Snap Shot -- $DATE" &>> $VBOX_LOGFILE 

# Remove Extra Daily SnapShots
for uuid in $(vbox_manage_extra_daily_snapshots.py "git_server");
    do VBoxManage snapshot "git_server" delete $uuid &>> $VBOX_LOGFILE;
done

# Unison back up of hone directory
unison home_to_backup -auto -batch -silent -logfile $UNISON_LOGFILE
