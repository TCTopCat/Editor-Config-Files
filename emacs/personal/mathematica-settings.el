(use-package wolfram-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.wl\\'" . wolfram-mode))
  (setq wolfram-program "/usr/local/bin/mathematica")
  (setq wolfram-path "~/.Mathematica/Applications/")
  )
