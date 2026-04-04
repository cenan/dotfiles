#!/usr/bin/env bash

# Only continue if kdeglobals exists
KDEGLOBALS="$HOME/.config/kdeglobals"
[ -f "$KDEGLOBALS" ] || exit 0

laf=$(grep -E '^LookAndFeelPackage=' "$KDEGLOBALS" | cut -d= -f2)

if [[ "$laf" == *dark* ]] || [[ "$laf" == *Dark* ]]; then
    tmux set -g @light 0
    tmux source-file ~/projects/dotfiles/tmux.dark.conf
else
    tmux set -g @light 1
    tmux source-file ~/projects/dotfiles/tmux.light.conf
fi

