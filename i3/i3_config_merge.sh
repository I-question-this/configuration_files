#!/bin/bash

# Directory definitions
CONFIG_DIR=$HOME/.config/i3
CONFIG_FILE=$CONFIG_DIR/config
PARTS_DIR=$CONFIG_DIR/parts

# Check for necessary directory
if [ ! -d $PARTS_DIR ]; then
  echo "ERROR: Directory not found:"
  echo $PARTS_DIR
  exit 1
fi

# Back up old config file (just in case)
if [ -f $CONFIG_FILE ]; then
  cp $CONFIG_FILE $CONFIG_FILE.old
  rm -f $CONFIG_FILE
fi

# Cat parts into config file
for part in $(ls $PARTS_DIR | sort); do
  cat $PARTS_DIR/$part >> $CONFIG_FILE
done

exit 0

