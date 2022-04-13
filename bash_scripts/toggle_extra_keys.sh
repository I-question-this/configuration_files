#!/bin/sh
# Toggle on and off the Termux extra keyboard keys
# These are helpful for when using a virtual keyboard
# less helpful when using a physical keyboard as they
# take up screen space.
# Since turning off the extra keys would make it very difficult, perhaps 
# impossible, to run this script again I recommend
# having a way to run the script outside Termux,
# such as the Termux:widget app.

prop=$HOME/.termux/termux.properties
temp=$HOME/.termux/termux.properties.temp

normal="extra-keys-style = default"
off="extra-keys = \[\[\]\]"

# Toggle extra-keys
if grep "\# $normal" $prop > /dev/null; then
  echo Turning on keys
  sed -e "s/\# $normal/$normal/g" $prop > $temp
  mv $temp $prop
  sed -e "s/$off/\# $off/g" $prop > $temp
  mv $temp $prop
else
  echo Turning off keys
  sed -e "s/$normal/\# $normal/g" $prop > $temp
  mv $temp $prop
  sed -e "s/\# $off/$off/g" $prop > $temp
  mv $temp $prop
fi

# Reload settings
termux-reload-settings
