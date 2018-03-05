#!/bin/bash

# Create the currebt date
DATE=$(date +%Y-%m-%d-%H-%M-%S)

# VirtualBox Daily Save State 
VBoxManage snapshot "git_server" take "Daily SnapShot -- $DATE" --description "Daily SnapShot -- $DATE"

# Unison back up of hone directory
unison home_to_backup -auto -batch -silent -logfile /var/log/unison/home_to_backup.log
