#!/usr/bin/env bash

function is_r2_running() {
  if pgrep -x "radare2" > /dev/null || pgrep -x "r2" > /dev/null
  then
    return 0
  else
    return 1
  fi
}

if ! is_r2_running
then
  WALLPAPERS=$HOME/Pictures/Wallpapers
  wal --vte -qi $WALLPAPERS
else
  echo -n "pywal breaks radare2, please close it gracefully so pywal doesn't "
  echo "kill it."
fi
