#!/bin/bash

SCRIPT_DIR=$( dirname $(readlink -f ${BASH_SOURCE[0]}) )
txtred=$(tput setaf 1)
txtgrn=$(tput setaf 2)
txtylw=$(tput setaf 3)
txtrst=$(tput sgr0)

function check() {
	if which $1 >/dev/null; then
		echo "${txtgrn}linking config for $1${txtrst}"
		return 0
	else
		echo "${txtylw}skipping config for $1${txtrst}"
		return 1
	fi
}

check "tmux"    && ln -fs $SCRIPT_DIR/tmux.conf $HOME/.tmux.conf
check "conky"   && ln -fs $SCRIPT_DIR/conkytmux $HOME/.conkytmux
check "guile"   && ln -fs $SCRIPT_DIR/guile $HOME/.guile
check "sqlite3" && ln -fs $SCRIPT_DIR/sqliterc $HOME/.sqliterc
check "git"     && ln -fs $SCRIPT_DIR/gitconfig $HOME/.gitconfig
check "hg"      && ln -fs $SCRIPT_DIR/hgrc $HOME/.hgrc

check "zsh"     && ln -fs $SCRIPT_DIR/zshrc $HOME/.zshrc
check "bash"    && ln -fs $SCRIPT_DIR/bashrc $HOME/.bashrc
ln -fs $SCRIPT_DIR/aliases $HOME/.aliases

check "emacs"   && ln -fs $SCRIPT_DIR/emacs/config.el $HOME/.emacs

if check "awesome"; then
	rm -f $HOME/.config/awesome
	ln -fs $SCRIPT_DIR/awesome $HOME/.config/awesome
fi

if check "mocp"; then
	mkdir -p $HOME/.moc/themes
	ln -fs $SCRIPT_DIR/moc/config $HOME/.moc/config
	ln -fs $SCRIPT_DIR/moc/themes/gokyuzu $HOME/.moc/themes/gokyuzu
fi

#TODO check for dotjs
#rm -f $HOME/.js
#ln -fs $SCRIPT_DIR/dotjs $HOME/.js

#FIXME overwrites old config
#ln -fs $SCRIPT_DIR/sshconfig $HOME/.ssh/config

#FIXME
#ln -fs $SCRIPT_DIR/Xdefaults $HOME/.Xdefaults
#xrdb -merge ~/.Xdefaults
