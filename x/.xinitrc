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
exec xss-lock -- ~/.local/bin/pixelated_lockscreen.sh &
# Background
exec ~/.fehbg &
# Color Scheme
exec wal -R &
# Compositor (which i3 does not provide)
exec picom -b &
# Program for applying special rules for what is and isn't transparent
exec devilspie -a &
# Notifications
exec dunst &
# Nvidia settings
nvidia-settings --load-config-only
# The actual window manager
exec i3
