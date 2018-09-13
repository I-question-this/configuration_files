#!/bin/bash -e

# The -e option has to do with the exporting of the bash variables

# Pick a random image from the specifed folder
image_dir=/home/tyler/Pictures/Wallpapers
image_name=$(ls  $image_dir| sort -R | tail -n 1)
file_uri="file://$image_dir/$image_name"

# Needed as crontab runs in a set of restricted variables
PID=$(pgrep gnome-session | tail -n1)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

# Needed to make gsettings able to change the background from within a bash script
DISPLAY=:0
GSETTINGS_BACKEND=dconf

# Change the background image manually as pywal is unable to do it in cron
gsettings set org.gnome.desktop.background picture-uri $file_uri
gsettings set org.gnome.desktop.screensaver picture-uri $file_uri


# Run pywal to change the color scheme of the current theme
# -g oomox to make gtk theme
# -q quiet
# -n skip setting the wallpaper
# -i path to the image
/usr/bin/env python3 -m pywal -n -g -q -i $image_dir/$image_uri
