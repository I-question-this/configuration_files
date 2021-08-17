#!/usr/bin/env bash

function is_r2_running() {
  if pgrep -x "radare2" > /dev/null || pgrep -x "r2" > /dev/null
  then
    return 0
  else
    return 1
  fi
}

function random_file() {
  find $1 -type f | sort -R | tail -n 1
}

if ! is_r2_running; then
  if [ "$#" -gt 1 ]; then
    echo "$0: `basename $0` <?wallpaper_path>"
    echo "wallpaper_path can be a file or a directory"
    exit 0
  else
    # Fall back on wallpaper folder to pick a random photo
    if [ "$#" -eq 0 ]; then
      wallpaper=$(random_file $HOME/Pictures/Wallpapers)
    # Else pick randomly from the input
    else
      wallpaper=$(random_file $1)
    fi

    # Determine size of the wallpaper image
    # Note used now, but maybe in the future
    width=$(identify -format "%w" "$wallpaper")> /dev/null
    height=$(identify -format "%h" "$wallpaper")> /dev/null

    # Set wallpaper with feh to get the full size of the image
    feh --bg-max $wallpaper

    # Change the colors, but skip setting the wallpaper
    wal --vte -nqi $wallpaper
  fi
else
  echo -n "pywal breaks radare2, please close it gracefully so pywal doesn't "
  echo "kill it."
fi
