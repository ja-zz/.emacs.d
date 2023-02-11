;;; init.el --- jazzmacs(tm)
;;; Commentary:
;;; Emacs and its cosequences have been a disaster for the human race.
;;; Code:
;;
;; general
(global-display-line-numbers-mode 1)
(setq column-number-mode t)
(menu-bar-mode 0) ;; remove if in text mode i think
(tool-bar-mode 0) ;; ditto
(setq auto-save-default nil)
(setq make-backup-files nil)
;;
;; reminder: put stupid /tmp stuff here later
;;
;; Life is unfair.
(add-to-list 'load-path "~/.emacs.d/scripts/")
;;
;; Ugly package installing stuff goes here.
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
;; evil, install
(unless (package-installed-p 'evil)
  (package-install 'evil))
;;
;; flycheck, install
(unless (package-installed-p 'flycheck)
  (package-install 'flycheck))
;;
;;
;; planet-theme, install
(unless (package-installed-p 'planet-theme)
  (package-install 'planet-theme)
  (load-theme 'planet t))
;;
;;
;;
;; Load theme before doing the rest
(when (package-installed-p 'planet-theme)
  (load-theme 'planet t))
;;==============================================================================
;; Even uglier package stuff. Because God doesn't love us.
;;
;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
;; evil
(require 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil))
 '(warning-suppress-log-types '((comp) (comp) (comp)))
 '(warning-suppress-types '((comp) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;
;;
;;
(provide 'init)
;;; init.el ends here
