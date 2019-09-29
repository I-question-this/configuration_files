#!/usr/bin/env bash

WALLPAPERS=$HOME/Pictures/Wallpapers
wal --vte -qi $WALLPAPERS
notify-send "Background changed" "Changed to: $(basename $(cat $HOME/.cache/wal/wal))"
