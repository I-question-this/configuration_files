#!/bin/bash -e

# The -e option has to do with the exporting of the bash variables

# Run pywal to change the color scheme of the current theme
# -g oomox to make gtk theme
# -q quiet
# -n skip setting the wallpaper
/usr/bin/env python3 -m pywal -n -g -q -i /home/tyler/Pictures/Wallpapers

# Needed as crontab runs in a set of restricted variables
PID=$(pgrep gnome-session | tail -n1)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

# Needed to make gsettings able to change the background from within a bash script
DISPLAY=:0
GSETTINGS_BACKEND=dconf

# Change the background to the one last used by pywal
gsettings set org.gnome.desktop.background picture-uri "file://$(< "/home/tyler/.cache/wal/wal")"

