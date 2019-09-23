#!/bin/sh

# Color Scheme
exec wal -R &
# Document Management
exec $HOME/.applications/zotero/zotero
# Lock Screen
# exec xss-lock -- ~/.bin/transfer-sleep-lock-i3lock.sh &
# Messaging
exec discord &
exec slack &
# Password Management
exec keepassxc &
# Window compositor (for transparency)
exec compton &
# Program for applying special rules for what is and isn't transparent
exec devilspie -a &
