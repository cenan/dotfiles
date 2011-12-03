#!/bin/bash

SCRIPT_DIR=$( dirname $(readlink -f ${BASH_SOURCE[0]}) )

ln -fs $SCRIPT_DIR/tmux.conf $HOME/.tmux.conf
ln -fs $SCRIPT_DIR/conkytmux $HOME/.conkytmux
ln -fs $SCRIPT_DIR/guile $HOME/.guile
ln -fs $SCRIPT_DIR/gitconfig $HOME/.gitconfig
ln -fs $SCRIPT_DIR/hgrc $HOME/.hgrc
ln -fs $SCRIPT_DIR/sqliterc $HOME/.sqliterc
ln -fs $SCRIPT_DIR/zshrc $HOME/.zshrc
rm -f $HOME/.js
ln -fs $SCRIPT_DIR/dotjs $HOME/.js
ln -fs $SCRIPT_DIR/awesome $HOME/.config/awesome

