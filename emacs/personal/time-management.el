;; Keep org up-to-date ?? Need better way to do this
(use-package org)

;; ORG keybindings
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-enforce-todo-dependencies t)
(defun find-main-todo-file ()
  "Opens the main to-do file. "
  (interactive)
  (find-file-other-frame "~/Documents/ORG-mode/TODOs.org"))
(global-set-key (kbd "C-c t") 'find-main-todo-file)

;; ORG global access
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

