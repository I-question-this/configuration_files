#!/bin/bash
# Code from: hund0b1 on github.com


img="$HOME/.cache/pixelated_screenshot.png"

# Take screenshot
scrot $img
# Pixelate image
convert $img -scale 10% -scale 1000% $img

echo $img
