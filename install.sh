#!/bin/bash

SCRIPT_DIR=$( dirname $(readlink -f ${BASH_SOURCE[0]}) )

ln -fs $SCRIPT_DIR/tmux.conf $HOME/.tmux.conf
ln -fs $SCRIPT_DIR/conkytmux $HOME/.conkytmux
ln -fs $SCRIPT_DIR/guile $HOME/.guile
ln -fs $SCRIPT_DIR/gitconfig $HOME/.gitconfig
ln -fs $SCRIPT_DIR/hgrc $HOME/.hgrc
ln -fs $SCRIPT_DIR/sqliterc $HOME/.sqliterc

ln -fs $SCRIPT_DIR/zshrc $HOME/.zshrc
ln -fs $SCRIPT_DIR/bashrc $HOME/.bashrc
ln -fs $SCRIPT_DIR/aliases $HOME/.aliases

rm -f $HOME/.js
ln -fs $SCRIPT_DIR/dotjs $HOME/.js
rm -f $HOME/.config/awesome
ln -fs $SCRIPT_DIR/awesome $HOME/.config/awesome

ln -fs $SCRIPT_DIR/emacs $HOME/.emacs

ln -fs $SCRIPT_DIR/sshconfig $HOME/.ssh/config

ln -fs $SCRIPT_DIR/Xdefaults $HOME/.Xdefaults
xrdb -merge ~/.Xdefaults
