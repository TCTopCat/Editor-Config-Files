(use-package matlab-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.m$'" . matlab-mode))
  (setq matlab-indent-function t)
  (setq matlab-shell-command "matlab")
  )
