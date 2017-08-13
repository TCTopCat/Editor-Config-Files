;;; Interface

(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)

;; Global packages
(use-package helm
  :bind (("M-SPC" . helm-M-x)
		 ("M-y" . helm-show-kill-ring)
		 ("C-x C-f" . helm-find-files)
		 ("M-s o" . helm-find-files)
		 ("<escape>" . keyboard-quit)
		 )
  :config
  (helm-mode 1)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 40)
  (setq helm-echo-input-in-header-line t)
  (define-key helm-map (kbd "S-SPC") 'helm-toggle-visible-mark)
  (define-key helm-find-files-map (kbd "C-k") 'helm-find-files-up-one-level))


(use-package company
  :diminish company-mode
  :config
  (global-company-mode)
  (setq company-idle-delay 0.2)
  (setq company-selection-wrap-around t)
  (define-key company-active-map [tab] 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

;Setting up evil
(use-package evil
  :config
  (evil-mode 1)
										; Basic navigation
  (define-key evil-normal-state-map 
    "h" 'evil-backward-char)
  (define-key evil-visual-state-map 
    "h" 'evil-backward-char)
  (define-key evil-normal-state-map 
    "t" 'evil-next-visual-line)
  (define-key evil-visual-state-map 
    "t" 'evil-next-visual-line)
  (define-key evil-normal-state-map 
    "gt" 'evil-next-line)
  (define-key evil-visual-state-map 
    "gt" 'evil-next-line)
  (define-key evil-normal-state-map 
    "n" 'evil-previous-visual-line)
  (define-key evil-visual-state-map 
    "n" 'evil-previous-visual-line)
  (define-key evil-normal-state-map 
    "gn" 'evil-previous-line)
  (define-key evil-visual-state-map 
    "gn" 'evil-previous-line)
  (define-key evil-normal-state-map 
    "s" 'evil-forward-char)
  (define-key evil-visual-state-map 
    "s" 'evil-forward-char)
										;Move around windows
  (define-key evil-normal-state-map (kbd "M-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "M-t") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "M-n") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "M-s") 'evil-window-right)
										; Escape quits everything
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

										; Working with Helm
  (define-key evil-ex-map "b" 'helm-mini)
  (define-key evil-ex-map "e" 'helm-find-files)
  
  (use-package evil-leader
    :config
    (global-evil-leader-mode))

  (use-package evil-surround
    :config
    (global-evil-surround-mode))

  (use-package evil-smartparens
	:config
	(evil-smartparens-mode t)
    )
  (use-package evil-goggles
	:config
	(evil-goggles-mode)
	(evil-goggles-use-diff-faces)
	))

(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd ":") 'evil-repeat-find-char)
  (define-key evil-motion-state-map (kbd "-") 'evil-ex)
  (define-key evil-normal-state-map "-" 'evil-ex)
  (define-key evil-visual-state-map "-" 'evil-ex))

;; Auto-saving
(recentf-mode t)
(setq recetnf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)






