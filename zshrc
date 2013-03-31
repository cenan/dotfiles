if [ -f ~/dotfiles/aliases ]; then
	source ~/dotfiles/aliases
fi

autoload colors; colors;
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]
then
  # Find the option for using colors in ls, depending on the version: Linux or BSD
  ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi

PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

#### OPTIONS ####

### Changing Directories ###

# If a command is issued that can't be executed as a normal command,
# and the command is the name of a directory, perform the cd command to that directory.
setopt auto_cd

# Make cd push the old directory onto the directory stack.
setopt auto_pushd

# If the argument to a cd command (or an implied cd with the AUTO_CD option set) is not a directory,
# and does not begin with a slash, try to expand the expression as if it were preceded by a '~'
setopt cdablevars

# Don't push multiple copies of the same directory onto the directory stack.
setopt pushd_ignore_dups

# If a completion is performed with the cursor within a word,
# and a full completion is inserted, the cursor is moved to the end of the word.
# That is, the cursor is moved to the end of the word if either a single match is
# inserted or menu completion is performed.
setopt always_to_end

# Automatically list choices on an ambiguous completion.
# setopt auto_list

# Automatically use menu completion after the second consecutive request for completion,
# for example by pressing the tab key repeatedly. This option is overridden by MENU_COMPLETE.
setopt auto_menu

# Any parameter that is set to the absolute name of a directory immediately becomes a name
# for that directory, that will be used by the '%~' and related prompt sequences, and will
# be available when completion is performed on a word starting with '~'. (Otherwise, the
# parameter must be used in the form '~param' first.)
setopt auto_name_dirs

# if unset, the cursor is set to the end of the word if completion is started.
# Otherwise it stays there and completion is done from both ends.
setopt complete_in_word

# on an ambiguous completion, instead of listing possibilities or beeping, insert the first
# match immediately. Then when completion is requested again, remove the first match and
# insert the second match, etc. When there are no more matches, go back to the first one again.
# reverse-menu-complete may be used to loop through the list in the other direction. This option
# overrides AUTO_MENU.
unsetopt menu_complete

#History

# If this is set, zsh sessions will append their history list to the history file,
# rather than replace it. Thus, multiple parallel zsh sessions will all have the
# new entries from their history lists added to the history file, in the order that
# they exit. The file will still be periodically re-written to trim it when the
# number of lines grows 20% beyond the value specified by $SAVEHIST
# (see also the HIST_SAVE_BY_COPY option).
setopt append_history

# Save each command's beginning timestamp (in seconds since the epoch) and the
# duration (in seconds) to the history file. The format of this prefixed data is:
#':<beginning time>:<elapsed seconds>:<command>'.
setopt extended_history

# If the internal history needs to be trimmed to add the current command line,
# setting this option will cause the oldest history event that has a duplicate
# to be lost before losing a unique event from the list. You should be sure to
# set the value of HISTSIZE to a larger number than SAVEHIST in order to give
# you some room for the duplicated events, otherwise this option will behave
# just like HIST_IGNORE_ALL_DUPS once the history fills up with unique events.
setopt hist_expire_dups_first

# Do not enter command lines into the history list if they are duplicates of the previous event.
setopt hist_ignore_dups

# Remove command lines from the history list when the first character on the line is a space,
# or when one of the expanded aliases contains a leading space. Note that the command lingers
# in the internal history until the next command is entered before it vanishes, allowing you
# to briefly reuse or edit the line. If you want to make it vanish right away without entering
# another command, type a space and press return.
setopt hist_ignore_space

# Whenever the user enters a line with history expansion, don't execute the line directly;
# instead, perform history expansion and reload the line into the editing buffer.
setopt hist_verify

# This options works like APPEND_HISTORY except that new history lines are added to the $HISTFILE
# incrementally (as soon as they are entered), rather than waiting until the shell exits. The file
# will still be periodically re-written to trim it when the number of lines grows 20% beyond the
# value specified by $SAVEHIST (see also the HIST_SAVE_BY_COPY option).
setopt inc_append_history

# This option both imports new commands from the history file, and also causes your typed commands
# to be appended to the history file (the latter is like specifying INC_APPEND_HISTORY).
# The history lines are also output with timestamps ala EXTENDED_HISTORY (which makes it easier to
# find the spot where we left off reading the file after it gets re-written).
# By default, history movement commands visit the imported lines as well as the local lines,
# but you can toggle this on and off with the set-local-history zle binding. It is also possible
# to create a zle widget that will make some commands ignore imported commands, and some include them.
# If you find that you want more control over when commands get imported, you may wish to turn
# SHARE_HISTORY off, INC_APPEND_HISTORY on, and then manually import commands whenever you need them
# using 'fc -RI'.
setopt share_history

# Expand aliases.
setopt aliases

# Try to correct the spelling of commands. Note that, when the HASH_LIST_ALL option is not set or
# when some directories in the path are not readable, this may falsely report spelling errors the
# first time some commands are used.
# The shell variable CORRECT_IGNORE may be set to a pattern to match words that will never be
# offered as corrections.
setopt correct

# Try to correct the spelling of all arguments in a line.
setopt correct_all
alias man='nocorrect man'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias mkdir='nocorrect mkdir'
alias gist='nocorrect gist'
alias heroku='nocorrect heroku'
alias ebuild='nocorrect ebuild'
alias hpodder='nocorrect hpodder'

# If set, parameter expansion, command substitution and arithmetic expansion are performed in prompts.
# Substitutions within prompts do not affect the command status.
setopt prompt_subst

# Perform implicit tees or cats when multiple redirections are attempted (see the section 'Redirection').
setopt multios

# EDIT COMMAND LINE
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# GREP
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# HISTORY
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# MISC
## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

## pager
export PAGER="less -R"
export LC_CTYPE=$LANG

# KEYBINDINGS
bindkey -e
bindkey '\ew' kill-region
bindkey -s '\el' "ls\n"
bindkey '^r' history-incremental-search-backward
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OF" end-of-line
bindkey ' ' magic-space    # also do history expansion on space

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey '^[[Z' reverse-menu-complete

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

