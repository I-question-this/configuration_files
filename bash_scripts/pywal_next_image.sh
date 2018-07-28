#!/bin/bash -e

# The -e option has to do with the exporting of the bash variables

# Pick a random image from the specifed folder
IMAGE_DIR=/home/tyler/Pictures/Wallpapers
IMAGE=$(ls  $IMAGE_DIR| sort -R | tail -n 1)

# Needed as crontab runs in a set of restricted variables
PID=$(pgrep gnome-session | tail -n1)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

# Needed to make gsettings able to change the background from within a bash script
DISPLAY=:0
GSETTINGS_BACKEND=dconf

# Change the background image manually as pywal is unable to do it in cron
gsettings set org.gnome.desktop.background picture-uri "file://$IMAGE_DIR/$IMAGE"

# Run pywal to change the color scheme of the current theme
# -g oomox to make gtk theme
# -q quiet
# -n skip setting the wallpaper
# -i path to the image
/usr/bin/env python3 -m pywal -n -g -q -i $IMAGE_DIR/$IMAGE
