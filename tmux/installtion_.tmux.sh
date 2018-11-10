#!/bin/bash
# make link to .tmux.conf
ln -s -f $(realpath .tmux/.tmux.conf) $HOME/.tmux.conf
# make link to my edits to the .tmux.conf.local
ln -s -f $(realpath .tmux.conf.local) $HOME/.tmux.conf.local
