#!/bin/bash
DESKTOP=biggamer:/home/tyler/Documents/KeepassXC/passwords.kdbx 
PHONE=~/Nextcloud/Documents/KeepassXC/passwords.kdbx

function usage() {
  echo "Usage:"
  echo "$(basename $0) upload"
  echo "$(basename $0) download"
}

if [ -z $1 ]; then
  usage
elif [ $1 = "upload" ]; then
  rsync -vP $PHONE $DESKTOP
elif [ $1 = "download" ]; then
  rsync -vP $DESKTOP $PHONE
else
  usage
fi
