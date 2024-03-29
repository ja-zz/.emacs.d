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
;; evil
(unless (package-installed-p 'evil)
  (package-install 'evil))
;;
;; company - autocomplete thing
(unless (package-installed-p 'company)
  (package-install 'company))
;;
;; dashboard - nicer splash screen
(unless (package-installed-p 'dashboard)
  (package-install 'dashboard))
;;
;; elcord - discord rich presence
(unless (package-installed-p 'elcord)
  (package-install 'elcord))
;;
;; flycheck - linting
(unless (package-installed-p 'flycheck)
  (package-install 'flycheck))
;;
;; php-mode - major mode for PHP
(unless (package-installed-p 'php-mode)
  (package-install 'php-mode))
;;
;; dracula-theme - alright looking color scheme
(unless (package-installed-p 'dracula-theme)
  (package-install 'dracula-theme)
  (load-theme 'dracula t))
;;
;;
;;
;; Load theme before doing the rest
(when (package-installed-p 'dracula-theme)
  (load-theme 'dracula t))
;;==============================================================================
;; Configuration for individual packages.
;;
;; dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "welcome to jazzmacs")
(setq dashboard-startup-banner "~/.emacs.d/img/jmsmall.png") ;; splash pic
(setq dashboard-center-content t)
;;
;; company
(add-hook 'after-init-hook 'global-company-mode)
;; elcord
(require 'elcord)
(elcord-mode)
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
 '(custom-safe-themes
   '("f681100b27d783fefc3b62f44f84eb7fa0ce73ec183ebea5903df506eb314077" default))
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
