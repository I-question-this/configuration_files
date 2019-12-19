#!/bin/bash

if [ -z $1 ]; then
  echo "Usage: $(basename $0) <system type>"
  exit 1
fi

ln -f bashrc $HOME/.bashrc
ln -f bash_logout $HOME/.bash_logout
ln -f profile $HOME/.profile

rm -rf ~/.bash_aliases
mkdir ~/.bash_aliases

# Make single file links
if [ "Ubuntu" = $1 ]; then
  ln -f Ubuntu/pam_environment $HOME/.pam_environment
  ln -f Ubuntu/xsessionrc $HOME/.xsessionrc
  exit 0
elif [ "Arch" = $1 ]; then
  ln -f Arch/xinitrc $HOME/.xinitrc
  exit 0
else
  echo "$1 is not a valid system name. Please select Ubuntu or Arch"
  exit 1
fi

