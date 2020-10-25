#!/bin/sh

cd $HOME/.unison

CONFIGS=$(ls configs)

for conf in $CONFIGS; do
  unison configs/$conf
done
