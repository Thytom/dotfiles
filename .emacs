;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package) (add-to-list 'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Packages
(require 'evil)
(require 'evil-surround)
(require 'autopair)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
	 [default default default italic underline success warning error])
 '(ansi-color-names-vector
	 ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
	 (quote
		("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "2116ed2bb7af1ff05bef1d9caf654ae2820088c86d50c83cd8f90bf83ce0cbcc" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" default)))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
	 (quote
		("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-files (quote ("~/Notes/Todo/todo.org")))
 '(package-selected-packages
	 (quote
		(evil-terminal-cursor-changer evil-org ## writeroom-mode autopair smart-mode-line evil-commentary use-package evil-surround)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
	 (quote
		((20 . "#BC8383")
		 (40 . "#CC9393")
		 (60 . "#DFAF8F")
		 (80 . "#D0BF8F")
		 (100 . "#E0CF9F")
		 (120 . "#F0DFAF")
		 (140 . "#5F7F5F")
		 (160 . "#7F9F7F")
		 (180 . "#8FB28F")
		 (200 . "#9FC59F")
		 (220 . "#AFD8AF")
		 (240 . "#BFEBBF")
		 (260 . "#93E0E3")
		 (280 . "#6CA0A3")
		 (300 . "#7CB8BB")
		 (320 . "#8CD0D3")
		 (340 . "#94BFF3")
		 (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comint-highlight-prompt ((t (:foreground "yellow"))))
 '(diff-refine-changed ((t (:background "brightblack"))))
 '(highlight ((t (:background "brightblack"))))
 '(info-index-match ((t (:inherit match :background "white"))))
 '(line-number ((t (:foreground "brightwhite" :weight normal))))
 '(match ((t (:background "white"))))
 '(minibuffer-prompt ((t (:foreground "brightwhite" :box (:line-width -1 :color "red" :style released-button) :weight bold))))
 '(mode-line ((t (:background "brightwhite" :foreground "black"))))
 '(org-agenda-clocking ((t (:inherit secondary-selection :background "brightblack"))))
 '(org-date ((t (:foreground "cyan" :underline t :weight bold))))
 '(org-document-info ((t (:foreground "blue"))))
 '(org-document-title ((t (:foreground "brightwhite" :weight bold))))
 '(org-done ((t (:foreground "brightgreen" :weight bold))))
 '(org-level-1 ((t (:inherit outline-1 :foreground "color-38" :weight normal))))
 '(org-level-2 ((t (:inherit outline-2))))
 '(org-level-3 ((t (:inherit outline-3 :foreground "white" :weight normal))))
 '(org-scheduled ((t (:foreground "brightgreen"))))
 '(org-special-keyword ((t (:foreground "color-242"))))
 '(org-table ((t (:foreground "brightwhite"))))
 '(region ((t (:background "brightblack"))))
 '(secondary-selection ((t (:background "brightblack"))))
 '(widget-field ((t (:foreground "brightwhite")))))

;; Transparent background
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)
(add-hook 'text-mode-hook 'auto-fill-mode)

;; User defined settings

(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
(setq backup-by-copying t)
(setq-default tab-width 2)

(load-theme 'misterioso)

;; Set Transparency
(set-frame-parameter (selected-frame) 'alpha '(85 85))
(add-to-list 'default-frame-alist '(alpha 85 85))

(evil-mode 1) ; Vim-Like
(evil-commentary-mode 1) ; Commenting with gcc
(menu-bar-mode -1) ; Disable Menu Bar
(global-display-line-numbers-mode)
(global-evil-surround-mode 1)
(autopair-global-mode 1)
(show-paren-mode 1) ; Show paired parenthesis
(setf org-startup-indented t)
(setq org-agenda-files (list "~/Notes/Todo/todo.org"))
(setq evil-want-C-i-jump nil)
(setq evil-insert-state-cursor '("#e2e222" bar))
(setq-default fill-column 80)
(setq x-select-enable-clipboard nil)
(setq enable-recursive-minibuffers 1)

;; Linux formatting
(setq c-default-style "linux"
          c-basic-offset 4)

;; Start emacs with an empty buffer
(setf inhibit-splash-screen t)
(setf vc-follow-symlinks nil)
(switch-to-buffer (get-buffer-create "Empty Buffer"))
(delete-other-windows)

;; Bindings
(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd ":") 'evil-repeat-find-char)
  (define-key evil-motion-state-map (kbd ";") 'evil-ex)
  )

(evil-define-key 'normal org-mode-map (kbd "TAB") #'org-cycle)
