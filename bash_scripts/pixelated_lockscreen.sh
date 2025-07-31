#!/bin/bash

i3lock -i $(dunstctl set-paused true; $HOME/.local/bin/pixelated_screenshot.sh)
