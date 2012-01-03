# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="muse"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git mercurial django debian lol pip)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export TERM="xterm-256color"

alias tmux="tmux -2" # force tmux to assume terminal supports 256 colors
alias rawsm="kill -1 `pidof awesome`"

alias v="vim"
alias sv="sudo vim"
alias e="emacs -nw"
alias se="sudo emacs -nw"

function sve() {
	source ~/.virtualenvs/$1/bin/activate
}

PATH=$PATH:~/bin:/opt/node/bin:~/projects/go/bin:~/google_appengine
CDPATH=.:~:~/projects

export GOROOT=~/projects/go

