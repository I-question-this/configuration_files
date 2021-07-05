#!/bin/bash
# Thank you to Wayne Stegner for this script
# https://github.com/stegnerw/config_files

# Directory definitions
BASE_DIR=$(realpath $(dirname "$0"))
CONFIG_DIR=$HOME/.config/i3
PARTS_DIR=$CONFIG_DIR/parts

# Clear parts directory
rm -rf $PARTS_DIR

# Create necessary directories
for dir in $CONFIG_DIR $PARTS_DIR; do
  if [ ! -d $dir ]; then
    mkdir $dir
  fi
done

# Create symlinks
for ext in .general .$(hostname); do
  for part in $(ls $BASE_DIR | grep $ext | sort); do
    src=$BASE_DIR/$part
    dst=$PARTS_DIR/$(basename $part $ext)
    ln -sf $src $dst
  done
done

exit 0

