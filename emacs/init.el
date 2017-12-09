;;; init.el --- Here, I setup my version of 'the' text editor.

;;; Commentary:
;;This is where I em... comment.

;;; Code:
;; setting up use-package
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
;; (add-to-list 'package-archives '("repo-org" . "http://orgmode.org/elpa/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)
										;---------------------------------------------------------------------------

(defun find-user-init-file ()
  "Edit the 'user-init-file in another window."
  (interactive)
  (find-file-other-window user-init-file))
(global-set-key (kbd "C-c i") 'find-user-init-file)

;; Load settings
(setq use-package-always-ensure t)
(add-to-list 'load-path "~/config-files/emacs/personal")

(load "display.el")
(load "interface.el")
(load "git-interface.el")
(load "text-editing.el")
(load "org-mode-settings.el")
(load "latex-settings.el")
(load "python-settings.el")
(load "mathematica-settings.el")
(load "android-settings.el")
(load "backup-settings.el")

;;; init.el ends here

										;---------------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" default)))
 '(inhibit-startup-screen t)
 '(nrepl-message-colors
   (quote
	("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-files (quote ("~/Documents/ORG-mode/TODOs.org")))
 '(package-selected-packages
   (quote
	(evil-goggles rainbow-delimiters magit pretty-mode adaptive-wrap 2048-game transpose-frame org wolfram-mode wolfram powerline 0xc evil-surround evil-leader evil-smartparens aggressive-indent company helm use-package material-theme zenburn-theme olivetti visual-fill-column 0blayout evil auctex)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1 :box nil :weight bold :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :box nil :height 1.2)))))
