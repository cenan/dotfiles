#!/bin/bash

sudo apt-get install git-core

sudo apt-get install mercurial
sudo apt-get install tortoisehg

sudo apt-get install exuberant-ctags
sudo apt-get install vim-gnome

sudo apt-get install tmux

sudo apt-get install moc

sudo apt-get install awesome

su -c "echo 'Dir::Ignore-Files-Silently:: \"(.save)$\";' > /etc/apt/apt.conf.d/99ignoresave"

