; -*- mode: lisp -*-

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

(setq scroll-step		1
      scroll-conservatively	10000)

;(normal-erase-is-backspace-mode 1)

(require 'package)
(add-to-list 'package-archives
	     '("marmalade" .
	     		   "http://marmalade-repo.org/packages/"))
(package-initialize)
(load-theme 'monokai t)

;(setq x-super-keysym 'meta)
;(setq x-meta-keysym 'super)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

; turn on evil mode
(require 'evil)
(evil-mode 1)
;(define-key evil-normal-state-map "\mx" 'execute-extended-command)

; turn off menu bar
(menu-bar-mode -1)
; turn off scroll bars
(scroll-bar-mode -1)
; turn off tool bars
(tool-bar-mode -1)


; auto follow sym links
(setq vc-follow-symlinks t)

; turn on line numbers
(global-linum-mode t)
; set spacing for line numbers
(setq linum-format "%3d ")




