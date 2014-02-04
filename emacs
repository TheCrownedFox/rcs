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

(add-to-list 'load-path "~/.emacs.d/my-plugins/evil-leader/")
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
(defalias 'vs 'vil-window-vsplit)

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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d46438a21363d1852b51fa1e346f4d15c681574de577fe64c788f1f9d7bfae87" "9e7c8ea4ccecaabd35e2365936289168c42f6868d829cd55f81b7ea1f19d6a6e" "a018b097b67ea6d69c3f3adf28f4bc609e9e16ebf5af99ae1d2a64070315b7d3" "8d76635bbe9bd891ef7bc956bc172e7f3d4411212a59fedb242f44b0a3016296" "5c2bf89be636de12daf6d11cdb4ed4c180cc787c96e31d0143f5667db0880261" "fecbfc61d1272b9b2002eceb0f51adf0bbd853bd170e33ff5ae9862d5b69553c" "93a2907f5a6a8c5202ba6f8f4412bf4054bb448e55adf51397cf12e76584d1d9" "8f2c5a9e9029a6fe1a3f25850c6b4223acf80f9400ac37d5e25b2624c278e164" "a740a1f736e765c3d0494af02f038b1f2a018c6dd0a98b618d125dc54cccae09" "11bb5e4d374a755a85c0de8c26b440b58ca91bd0692e2480f4cad081e8a85b40" "2c57c2f17bd138c6d0e19ab60a0ddde1b21df0428fad0546507428e5af818cfd" "73ee577e114a5ed9f5c0ffc673faffed9d34470440177cfe21a53524b3bf1256" "fa15db65f804cc6efd304886ce77a12debd87b71143e3af99523eb0edf2d291e" "e9b00731f309600e82eff162213374211e37c6836fc2f01128e2e15757c0f92f" "b8ba278b8128bdb001abb9d28d8b6171cb4b46e1d11c69ccf5f043e05b245920" "da965d15a9115fe230d6fe56c124eb64d5117d870d3990586226641fd1f9382b" "2329d19efbe6da22f70e14cfbba6485b03c54b55447ad05aea615e1e337e3828" "01e5923529977f8dcdd8acf4192b7941cf036a2e2ab7cf75b500c674d81d90d7" "13a6a943220dea3df51722046e7ab40a11bfd075a35bac55ed3bbb1f39ef27f1" "196ebbc0bfa36a6f3b9a883ac1fb0d92c343846a832ca685c3b41ba1cebe256e" "7d1eaaaa4557402c5d6201ff460a43cb50454c6923cb7b0884849edc97ccc5be" "4de787f9d7e96449773a2c24710a89fa9cd215b8b7582815fabba443c8f147b0" "45774a8ab87f41f16987f3aff40578c6e9221a5b9da9ca45f8a3c8337b864f21" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "nil")))))


(add-to-list 'load-path "~/.emacs.d/my-plugins/enhanced-ruby-mode")
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

;(remove-hook 'enh-ruby-mode-hook 'erm-define-faces)

(setq font-lock-maximum-decoration t)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb" . web-mode))

; auto start rainbow-mode when editing scss files
;(add-to-list 'auto-mode-alist '("\\.scss$" . rainbow-mode))

