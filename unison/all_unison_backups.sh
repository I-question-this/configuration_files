#!/bin/bash

UNISON_DIR="$HOME/.unison"
cd $UNISON_DIR
rm -rf $UNISON_DIR/old_logs
mv $UNISON_DIR/logs $UNISON_DIR/old_logs
make -k -j 2

