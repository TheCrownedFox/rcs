; -*- mode: lisp -*-

(defun find-user-init-file ()
  "Open init file in another window"
  (interactive)
  (split-window-horizontally)
  (find-file user-init-file))

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)

; set single line scroll
(setq scroll-step		1
      scroll-conservatively	10000)

; turn off menu bar
(menu-bar-mode -1)
; turn off scroll bars
(scroll-bar-mode -1)
; turn off tool bars
(tool-bar-mode -1)

;(normal-erase-is-backspace-mode 1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(require 'package)
(add-to-list 'package-archives
	     '("marmalade" .
	     		   "http://marmalade-repo.org/packages/"))
(package-initialize)
(load-theme 'molokai t)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

; turn on evil mode
(require 'evil)
(evil-mode 1)
;(define-key evil-normal-state-map "\mx" 'execute-extended-command)
(evil-ex-define-cmd "Q[uit]" 'evil-quit)
(evil-ex-define-cmd "W[rite]" 'evil-write)
(evil-ex-define-cmd "Wq" 'evil-save-and-close)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(add-to-list 'load-path "~/.emacs.d/git-plugins/evil-leader/")
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  "\\" 'evil-execute-in-emacs-state
  "mx" 'execute-extended-command
  "w" 'evil-window-next
  "t" 'other-frame
  "f" 'make-frame-command
  "v" 'find-user-init-file
  )

; eshell aliases
(defalias 'vs 'evil-window-vsplit)

; auto follow sym links
(setq vc-follow-symlinks t)

; turn on line numbers
(global-linum-mode t)
; set spacing for line numbers
(setq linum-format "%3d ")

; store backup/autosave files in tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(add-to-list 'load-path "~/.emacs.d/git-plugins/enhanced-ruby-mode")
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

;(remove-hook 'enh-ruby-mode-hook 'erm-define-faces)

(setq font-lock-maximum-decoration t)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb" . web-mode))

; auto start rainbow-mode when editing scss files
;(add-to-list 'auto-mode-alist '("\\.scss$" . rainbow-mode))

