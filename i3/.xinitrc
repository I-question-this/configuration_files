#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Lock screen
exec xss-lock -- ~/.bin/transfer-sleep-lock-i3lock.sh &
# Background
exec ~/.fehbg &
# Browsing
exec firefox &
# Dropbox
exec dropbox &
# Messaging
exec discord-ptb &
exec slack &
# Reading
exec mendeleydesktop &
# Security
exec keepassxc &
# Color Scheme
exec wal -R &
# Window editor (for transparency)
exec xcompmgr &
# Program for applying special rules for what is and isn't transparent
exec devilspie -a &
# The actual window manager
exec i3
