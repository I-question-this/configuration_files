#!/bin/bash
# Code from: hund0b1 on github.com

# Define the path to the image
img="$HOME/.cache/pixelated_screenshot.png"

# Delete the previously taken image
rm -f $img

# Take screenshot
scrot $img
# Pixelate image
convert $img -scale 10% -scale 1000% $img

# Print the path to the created image
echo $img
