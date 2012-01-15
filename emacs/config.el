
(add-to-list 'load-path "~/dotfiles/emacs/")

;; Color theme
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)
;(color-theme-charcoal-black)
(load "color-theme-tomorrow")
(color-theme-tomorrow-night-eighties)

; disable menu and toolbar
(menu-bar-mode 0)
(tool-bar-mode 0)

; scroll by one line
(setq scroll-setp           1
	  scroll-conservatively 10000)

; enable mouse
(xterm-mouse-mode)

(show-paren-mode 1)

(setq explicit-shell-file-name "/bin/bash")

