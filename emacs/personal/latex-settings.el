;; LaTeX editing settings
;; Fundamental
(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t))

(add-hook 'LaTeX-mode-hook 'set-buffer-olivetti-variable-pitch)
