#!/bin/bash

if [ $(dunstctl is-paused) = "true" ]; then 
  rm ~/.config/dunst/is_unpaused; 
else 
  touch ~/.config/dunst/is_unpaused; 
fi
