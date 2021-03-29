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
  if [ "$#" -eq 0 ]; then
    WALLPAPERS=$HOME/Pictures/Wallpapers
    wal --vte -qi $WALLPAPERS --iterative
  elif [ "$#" -eq 1 ]; then
    wal --vte -qi $1
  else
    echo "$0: `basename $0` <?wallpaper_path>"
    exit 0
  fi
else
  echo -n "pywal breaks radare2, please close it gracefully so pywal doesn't "
  echo "kill it."
fi
