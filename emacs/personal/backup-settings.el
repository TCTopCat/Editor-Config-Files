;;; backup-settings.el --- Reconfigures emacs to store all file backups in one central location.

;;; Commentary:

;;; Code:
(setq backup-directory-alist `(("." . "~/.EmacsBackups")))
(setq backup-by-copying t)
