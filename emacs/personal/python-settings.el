;;; python-settings.el --- Setting up the python/ipython IDE
;;; Commentary:

;;; Code:
(setq python-shell-interpreter "python3")

(use-package elpy
  :init
  (elpy-enable)
  :config
  (elpy-use-ipython)
  )

(use-package jedi
  :config
  (autoload 'jedi:setup "jedi" nil t)
  (add-hook 'pyhton-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t))

(use-package py-autopep8
  :config
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))




