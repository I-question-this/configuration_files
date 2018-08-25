#!/bin/bash

## Python ##
# Python
sudo apt install python3
# pip
sudo apt install python3-pip
sudo -H pip3 install --upgrade pip
sudo -H pip3 install numpy
sudo -H pip3 install scipy

## Ploting Programs ##
# xmgrace
sudo apt install grace

## Video Editors ##
sudo apt install ffmpeg

## Wine ##
sudo apt install wine
sudo apt install winetricks # Unvalidated package name
sudo apt install playonlinux

## LaTeX ##
sudo apt install gummi

## IDEs ##
# Jetbrains toolkit

## Virtual Machines ##
sudo apt install -f ~/.install_everything/deb_files/virtualbox.deb

## Back Up ##
sudo apt install unison

## Diagrams ##
sudo apt install dia

## Text Editor ##
sudo apt install geany
sudo apt install vim

## Image Editor ##
sudo apt install gimp

## Partion Manager ##
sudo apt install gparted

## Debbugger Program ##
sudo apt install ddd

## Diff Viewer ##
sudo apt install meld

# Blender
sudo apt install blender

# VLC
sudo apt install vlc

# Chromium
sudo apt install chromium-bsu

# LMMS -- Music Maker
sudo apt install lmms

# Audacity -- Music Editer
sudo apt install audacity

# Nvidia Drivers
# https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install nvidia-390

# Snippet Tool
sudo apt install shutter


## Downloaded Programs ##
# Install Ardinio IDE
cd ~/apps/arduino-1.6.13
sudo ./install.sh

# PyCharm
cd ~/apps/pycharm-2016.3/bin
sudo ./pycharm.sh

# CLion
cd ~/apps/clion-2016.3/bin
sudo ./clion.sh

# IntelliJ IDEA Ultimate
cd ~/apps/idea-IU-163.7743.44/bin
sudo ./idea.sh

# Steam
cd ~/apps/debs
sudo dpkg -i ./steam_latest.deb
sudo apt install -f

# Sublime Text
cd ~/apps
sudo dpkg -i ./sublime-text_build-3126_amd65.deb
sudo apt install -f

# VMD
cd ~/apps/vmd-1.9.3
sudo ./configure
cd src
sudo make install
