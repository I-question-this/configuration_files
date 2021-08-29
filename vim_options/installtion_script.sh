#!/bin/bash

ln -s -f $(realpath vimrc) $HOME/.vimrc
mkdir -p $HOME/.vim
ln -s -f $(realpath spell) $HOME/.vim
ln -s -f $(realpath snippets) $HOME/.vim
