;; Text formatting
										; Parentheses
(use-package smartparens
  :config
  (smartparens-global-mode t)
  (smartparens-global-strict-mode t))
(show-paren-mode 1)

(use-package aggressive-indent
  :config
  (global-aggressive-indent-mode 1)
										;  (add-to-list 'aggressive-indent-excluded-modes 'html-mode)
  )
