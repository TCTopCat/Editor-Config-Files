;; GUI
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq-default frame-title-format '("%f"))

(setq split-height-threshold nil)
(setq split-width-threshold 70)

;; Themes
(use-package zenburn-theme
  :defer t)
(use-package material-theme
  :defer t)
(use-package spacemacs-dark-theme
  :defer t)
(use-package darktooth-theme
  :defer t)
(use-package atom-one-dark-theme
  :config
  (load-theme 'atom-one-dark t))
(use-package atom-dark-theme
  :init
  (load-theme 'atom-dark t))
										; Window display
(use-package powerline
  :config (powerline-center-evil-theme))
(use-package transpose-frame)

(use-package golden-ratio
  :diminish golden-ratio-mode
  :init
  (golden-ratio-mode t)
  (setq golden-ratio-auto-scale t)
  :config
  (setq golden-ratio-extra-commands
		(append golden-ratio-extra-commands
				'(evil-window-left
				  evil-window-right
				  evil-window-up
				  evil-window-down))))

;; Text layout
(setq-default tab-width 4)
(use-package adaptive-wrap
  :diminish visual-line-mode
  :config
  (add-hook 'visual-line-mode-hook
			(lambda ()
			  (adaptive-wrap-prefix-mode t)))
  )
(global-visual-line-mode t)


;; Global highlighting
(use-package rainbow-delimiters)
										; (setq auto-fill-mode t)

;; Fonts
(use-package olivetti)

(defun set-buffer-olivetti-variable-pitch ()
  "With notable exceptions, activates 'variable-pitch mode and 'olivetti-mode, such that the text is (hopefully) easier to read."
  (interactive)
  (variable-pitch-mode t)
  (olivetti-mode t)
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-link nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-date nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-special-keyword nil :inherit 'fixed-pitch)
  )

(add-hook 'org-mode-hook 'set-buffer-olivetti-variable-pitch)
(add-hook 'markdown-mode-hook 'set-buffer-olivetti-variable-pitch)
(add-hook 'Info-mode-hook 'set-buffer-olivetti-variable-pitch)
(add-hook 'help-mode-hook 'set-buffer-olivetti-variable-pitch)

;; Text Display
(use-package idle-highlight-mode
  :init 
  (idle-highlight-mode t)
										;TODO: make global
  )

;; Prettify Symbols
(defun prettify-letters ()
  "Assigns replacement unicode characters to certain string sequences."
  (interactive)
  (setq prettify-symbols-alist
		'(
		  ("lambda" . 955) ; λ
		  ("->" . 8594)    ; →
		  ("=>" . 8658)    ; ⇒
		  ("map" . 8614)   ; ↦
		  ("def" . #x2131) ; ℱ
		  ("!=" . 8800) ; ≠
		  ("\\[Rho]" . 961) ; ρ
		  ("\\[Omega]" . 969 ) ; ω
		  ("\\[CapitalOmega]" . 937) ; Ω
		  ("\\[CapitalDelta]" . 916 ) ; Δ
		  ("\\[CapitalPhi]" . 934 ) ; Φ 
		  ("\\[Phi]" . 966 ) ; φ
		  )))
(add-hook 'wolfram-mode-hook 'prettify-letters)
(global-prettify-symbols-mode t)
(setq prettify-symbols-unprettify-at-point 'right-edge)



