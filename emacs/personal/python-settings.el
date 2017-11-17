(setq python-shell-interpreter "python3")

(use-package jedi
  :config
  (autoload 'jedi:setup "jedi" nil t)
  (add-hook 'pyhton-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t))

(use-package elpy
  :init
  (elpy-enable)
  )
