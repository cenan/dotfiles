#!/usr/bin/env bash

# Detect OS
OS="$(uname -s)"

is_dark_mode() {
    case "$OS" in
        Darwin)
            # macOS: Check AppleInterfaceStyle
            # Returns "Dark" if dark mode is enabled, empty if light mode
            local style
            style=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
            [[ "$style" == "Dark" ]]
            ;;
        Linux)
            # Linux: Check KDE kdeglobals
            local KDEGLOBALS="$HOME/.config/kdeglobals"
            if [[ -f "$KDEGLOBALS" ]]; then
                local laf
                laf=$(grep -E '^LookAndFeelPackage=' "$KDEGLOBALS" | cut -d= -f2)
                [[ "$laf" == *dark* ]] || [[ "$laf" == *Dark* ]]
            else
                # Default to dark if no KDE config
                return 0
            fi
            ;;
        *)
            # Unknown OS, default to dark
            return 0
            ;;
    esac
}

if is_dark_mode; then
    tmux set -g @light 0
    tmux source-file ~/projects/dotfiles/tmux.dark.conf
else
    tmux set -g @light 1
    tmux source-file ~/projects/dotfiles/tmux.light.conf
fi
