#!/bin/bash

function install_package() {
	sudo apt-get install $1
}

install_package curl
install_package openssh-server
install_package moc
install_package conky

install_package git-core
install_package tig git-gui giggle

install_package mercurial
install_package tortoisehg

install_package vim-gnome
install_package exuberant-ctags

# TODO: add backports if we are on an older distro for tmux 1.5
install_package tmux

install_package awesome

install_package sqlite3
install_package python-mysqldb

su -c "echo 'Dir::Ignore-Files-Silently:: \"(.save)$\";' > /etc/apt/apt.conf.d/99ignoresave"

git clone git@github.com:cenanozen/dotvim.git /home/cenan/.vim
git clone git@github.com:cenanozen/dotfiles.git /home/cenan/dotfiles

# TODO: install monaco font

