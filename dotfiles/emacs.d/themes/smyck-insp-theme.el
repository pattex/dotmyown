(deftheme smyck-insp
  "Smyck-Insp: A incompetently implemented emacs color theme, inspired by the beautyful Smyck Color Scheme <http://color.smyck.org/>.")
(custom-theme-set-faces
  'smyck-insp
    '(default ((t (:foreground "#f8f8f8" :background "#242424" ))))
    '(linum ((t (:foreground "#939393" :background "#242424" ))))
    '(font-lock-comment-delimiter-face ((t (:foreground "#939393" :italic t ))))
    '(font-lock-comment-face ((t (:foreground "#939393" :italic t ))))
    '(hl-line ((t (:background "#323232" ))))
    '(trailing-whitespace ((t (:background "#454b51"))))
    '(diff-added ((t (:foreground "#f8f8f8" :background "#253b22" ))))
    '(diff-changed ((t (:foreground "#f8f8f8" :background "#4a410d" ))))
    '(diff-header ((t (:foreground "#f8f8f8" :italic t :background "#0e2231" ))))
    '(diff-hunk-header ((t (:foreground "#f8f8f8" :italic t :background "#0e2231" ))))
    '(diff-removed ((t (:foreground "#f8f8f8" :background "#420e09" ))))
    '(css-property ((t (:foreground "#c5af75" ))))
    '(css-proprietary-property ((t (:foreground "#c5af75" ))))
    '(css-selector ((t (:foreground "#8b98ab" ))))
    '(border ((t (:background "#323232" ))))
    '(cursor ((t (:background "#fffa04" ))))
    '(font-lock-builtin-face ((t (:foreground "#f4f4f4" ))))
    '(font-lock-constant-face ((t (:foreground "#faa49c" ))))
    '(font-lock-doc-face ((t (:foreground "#ddf2a4" ))))
    '(font-lock-function-name-face ((t (:foreground "#f4f4f4" ))))
    '(font-lock-keyword-face ((t (:foreground "#d1fa72" ))))
    '(font-lock-negation-char-face ((t (:foreground "#ebebeb" ))))
    '(font-lock-preprocessor-face ((t (:foreground "#8996a8" ))))
    '(font-lock-regexp-grouping-backslash ((t (:foreground "#cf7d34" ))))
    '(font-lock-regexp-grouping-construct ((t (:foreground "#cf7d34" ))))
    '(font-lock-string-face ((t (:foreground "#fffa04" ))))
    '(font-lock-type-face ((t (:foreground "#9DEEF2" ))))
    '(font-lock-variable-name-face ((t (:foreground "#9DEEF2" ))))
    '(font-lock-warning-face ((t (:foreground "#fd5ff1" :background "#472847" ))))
    '(fringe ((t (:background "#323232" ))))
    '(highlight ((t (:background "#1d5766" ))))
    '(isearch ((t (:foreground "#f8f8f8" :background "#4a410d" ))))
    '(isearch-fail ((t (:foreground "#f8f8f8" :background "#420e09" ))))
    '(iswitchb-current-match ((t (:foreground "#f8f8f8" :background "#253b22" ))))
    '(iswitchb-invalid-regexp ((t (:foreground "#f8f8f8" :background "#420e09" ))))
    '(iswitchb-single-match ((t (:foreground "#f8f8f8" :background "#253b22" ))))
    '(iswitchb-virtual-matches ((t (:foreground "#f8f8f8" :background "#4a410d" ))))
    '(match ((t (:foreground "#f8f8f8" :background "#253b22" ))))
    '(menu ((t (:foreground "#f8f8f8" :background "#1b1b1b" ))))
    '(minibuffer-prompt ((t (:foreground "#89bdff" ))))
    '(mode-line ((t (:foreground "#60a633" :background "#242424" ))))
    '(mode-line-buffer-id ((t (:foreground "#a5eafc" ))))
    '(mode-line-emphasis ((t (:foreground "#e9c062" :bold t ))))
    '(mode-line-highlight ((t (:foreground "#e9c062" :italic t ))))
    '(mode-line-inactive ((t (:background "#1d5766" ))))
    '(region ((t (:background "#1d5766" ))))
    '(secondary-selection ((t (:background "#1d5766" ))))
    '(show-paren-match-face ((t (:background "#1d5766" ))))
    '(show-paren-mismatch-face ((t (:foreground "#fd5ff1" :background "#472847" ))))
)

(provide-theme 'smyck-insp)