(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(require 'package)
(add-to-list
 'package-archives
 '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(require 'wide-column)
(wide-column-mode t)

;;disable splash screen and startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(tool-bar-mode 0)
(blink-cursor-mode 0)
(scroll-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("a69959650ec28629bf703e5ae9803a9e1b7c3edd5af334a6b5a736ce966422e8" default)))
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(menu-bar-mode nil)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-face-attribute 'default nil :height 93)
(global-hl-line-mode t)
(global-linum-mode t)
(setq linum-format "%4d ")
(load-theme 'smyck-insp t)

(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)
(setq scroll-conservatively 1000)
(setq scroll-margin 5)
