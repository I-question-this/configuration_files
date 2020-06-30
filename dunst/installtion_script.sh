#!/bin/bash

mkdir -p $HOME/.config/dunst
ln -s -f $(realpath dunstrc) $HOME/.config/dunst/dunstrc
