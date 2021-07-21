#!/bin/bash

if [ $(dunstctl is-paused) = "true" ]; then 
  rm -f ~/.config/dunst/is_unpaused; 
else 
  touch ~/.config/dunst/is_unpaused; 
fi
