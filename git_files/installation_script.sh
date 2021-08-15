#!/bin/bash

ln -s -f $(realpath gitconfig) $HOME/.gitconfig
ln -s -f $(realpath gitignore) $HOME/.gitignore
ln -s -f $(realpath git_template) $HOME/.git_template

