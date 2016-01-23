
(add-to-list 'load-path "~/dotfiles/emacs/")
(add-to-list 'load-path "~/dotfiles/emacs/color-theme-6.6.0")

;(eval-after-load "color-theme"
  ;'(progn
	;(color-theme-initialize)
	;(color-theme-tomorrow)))
;; Color theme
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)
;(color-theme-charcoal-black)
(load "color-theme-tomorrow")
(color-theme-tomorrow-night-eighties)

(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
			package-archives )
(push '("melpa" . "http://melpa.milkbox.net/packages/")
			package-archives)
(package-initialize)

(require 'evil)
(evil-mode 1)

(define-key evil-normal-state-map (kbd ",f") 'projectile-find-file)
(define-key evil-normal-state-map (kbd ",,") 'evil-buffer)
(define-key evil-normal-state-map (kbd "q") nil)

(define-key evil-insert-state-map (kbd "C-e") nil)
(define-key evil-insert-state-map (kbd "C-d") nil)
(define-key evil-insert-state-map (kbd "C-k") nil)
(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "C-c") 'evil-normal-state)

(define-key evil-motion-state-map (kbd "C-e") nil)
(define-key evil-visual-state-map (kbd "C-c") 'evil-exit-visual-state)

;(define-key evil-normal-state-map (kbd "M-x") 'execute-extended-command)

(require 'evil-rails)

; disable menu and toolbar
(menu-bar-mode 0)
(tool-bar-mode 0)

; scroll by one line
(setq scroll-setp           1
	  scroll-conservatively 10000)

; enable mouse
(xterm-mouse-mode)

; silence on startup
(setq inhibit-startup-screen 1)

(show-paren-mode 1)

(setq explicit-shell-file-name "/bin/bash")

(global-hl-line-mode t)
