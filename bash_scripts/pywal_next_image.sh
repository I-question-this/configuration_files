#!/bin/bash -e

# The -e option has to do with the exporting of the bash variables

## IMAGE SELECTION
# Pick a random image from the specifed folder
image_dir=/home/tyler/Pictures/Wallpapers
image_name=$(ls  $image_dir| sort -R | tail -n 1)
image_path=$image_dir/$image_name
image_uri="file://$image_path"

## BACKGROUND/LOCKSCREEN CHANGE
# Needed as crontab runs in a set of restricted variables
PID=$(pgrep gnome-session | tail -n1)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

# Needed to make gsettings able to change the background from within a bash script
DISPLAY=:0
GSETTINGS_BACKEND=dconf

# Change the background image manually as pywal is unable to do it in cron
gsettings set org.gnome.desktop.background picture-uri $image_uri
gsettings set org.gnome.desktop.screensaver picture-uri $image_uri

# Determine best method of fitting based on image height and width
width=$(identify -format "%w" "$image_path")> /dev/null
height=$(identify -format "%h" "$image_path")> /dev/null

if ((height > width)); then
	image_fitting_option="scaled"
else
	image_fitting_option="stretched"
fi

gsettings set org.gnome.desktop.background picture-options $image_fitting_option
gsettings set org.gnome.desktop.screensaver picture-options $image_fitting_option

## HTTP SERVER
server_directory=/tmp/background_server
# Make directory in /tmp for the server
mkdir -p $server_directory
# Copy image to a tempory file
cp $image_path $server_directory/current_background
# Only start http-server if it is not already running
if ! ps -ef | grep -q  /usr/local/bin/http-server | grep -vq grep; then
	cd $server_directory
	# -s : silient mode
	# -c-1 : limit cache to none, i.e. turn the cache off.
	# 	 It's a local server, so it's not costly
	#        to pull the image.
	/usr/local/bin/http-server -p 8181 -s -c60 &> $server_directory/log.txt &
	cd -
fi

## PYWAL
# Run pywal to change the color scheme of the current theme
# -g oomox to make gtk theme
# -q quiet
# -n skip setting the wallpaper
# -i path to the image
/usr/bin/env python3 -m pywal -n  -q -i $image_path
