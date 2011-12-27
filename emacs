
(add-to-list 'load-path "~/.emacs.d/")

;; Color theme
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)
(color-theme-charcoal-black)


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

