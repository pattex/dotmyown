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

;; Auto refresh buffers
(global-auto-revert-mode t)

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

;; Spelling
(require 'rw-language-and-country-codes)
(require 'rw-ispell)
(require 'rw-hunspell)
(setq ispell-program-name "hunspell"
      ispell-dictionary "de_DE") ; Default dictionary to use

(dolist (hook '(text-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
      (add-hook hook (lambda () (flyspell-mode -1))))

;; Emacs for mail editing
;;(server-start)
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
(defun my-mail-mode-hook ()
     (auto-fill-mode 1)
     (abbrev-mode 1)
     (flyspell-mode 1)
     ;;(local-set-key "\C-Xk" 'server-edit)
     )
(add-hook 'mail-mode-hook 'my-mail-mode-hook)

(add-to-list 'auto-mode-alist '(".md" . markdown-mode))
(add-to-list 'auto-mode-alist '(".markdown" . markdown-mode))

;; Add rhtml-mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/rhtml-minor-mode"))
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '(".rhtml" . rhtml-mode))

;; Add coffee-mode
(require 'coffee-mode)
(custom-set-variables '(coffee-tab-width 2))
(add-to-list 'auto-mode-alist '(".coffee" . coffee-mode))

;; Add haml-mode
(require 'haml-mode)
(add-to-list 'auto-mode-alist '(".haml" . haml-mode))

(setq tramp-default-method "ssh")

(set-face-attribute 'default nil :height 93)
(global-hl-line-mode t)
(global-linum-mode t)
(setq linum-format "%4d ")
(load-theme 'smyck-insp t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(custom-set-variables '(javascript-tab-width 2))

(setq-default show-trailing-whitespace t)
(setq scroll-conservatively 1000)
(setq scroll-margin 5)
