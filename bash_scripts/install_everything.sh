#!/bin/bash

## APT ##
# Python & Python3
sudo apt install python
sudo apt install python3

# pip & pip3
sudo apt install python-pip
sudo apt install python3-pip

# xmgrace
sudo apt install grace

# ffmpeg
sudo apt install ffmpeg

# Wine
sudo apt install wine

# PlayOnLinux
sudo apt install playonlinux

# Gummi
sudo apt install gummi

# Geany
sudo apt install geany

# VirtualBox
sudo apt install virtualbox

# Unison
sudo apt install unison

# Dia
sudo apt install dia

# Vim
sudo apt install vim

# Gimp
sudo apt install gimp

# Gpared Partion Manager
sudo apt install gparted

# Data Display Debugger
sudo apt install ddd

# Meld Diff Viewer
sudo apt install meld

# Blender
sudo apt install blender

# X11VNC Server
sudo apt install x11vnc

# VLC
sudo apt install vlc

# Chromium
sudo apt install chromium-bsu

# LMMS -- Music Maker
sudo apt install lmms

# Audacity -- Music Editer
sudo apt install audacity

## PIP & PIP3 ##
sudo -H pip install --upgrade pip
sudo -H pip3 install --upgrade pip
# numericalunits
sudo -H pip install numericalunits
sudo -H pip3 install numericalunits

# numpy
sudo -H pip install numpy
sudo -H pip3 install numpy

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
