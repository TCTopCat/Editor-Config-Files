;; LaTeX editing settings

;; Fundamental
(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-PDF-mode t)
  (TeX-global-PDF-mode t)
  (use-package cdlatex))

;; Text editing / display
;; (use-package predictive
;;   :init
;;   (add-hook 'LaTeX-mode-hook 'predictive-mode t)
;;   (add-hook 'org-mode-hook 'predictive-mode t)
;;   )

(add-hook 'LaTeX-mode-hook 'set-buffer-olivetti-variable-pitch)
(add-hook 'LaTeX-mode-hook 'flyspell-mode t)

;; Custom structure templates
										;LaTeX

;; Default figure placement
(setq org-latex-default-figure-position "tbp" )


(use-package ox
  :defer t
  :config
  (use-package ox-latex
	:ensure f
	)
  ;; ** <<APS journals>>
  (add-to-list 'org-latex-classes '("revtex4-1"
									"\\documentclass[aps,prl,twocolumn]{revtex4-1}
																	[NO-DEFAULT-PACKAGES] [PACKAGES] [EXTRA]"
									("\\section{%s}" . "\\section*{%s}")
									("\\subsection{%s}" . "\\subsection*{%s}")
									("\\subsubsection{%s}" . "\\subsubsection*{%s}")
									("\\paragraph{%s}" . "\\paragraph*{%s}")
									("\\subparagraph{%s}" .
									 "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes '("nature"
									"\\documentclass[fleqn,10pt]{wlscirep}
																	[NO-DEFAULT-PACKAGES] [PACKAGES] [EXTRA]"
									("\\section{%s}" . "\\section*{%s}")
									("\\subsection{%s}" . "\\subsection*{%s}")
									("\\subsubsection{%s}" . "\\subsubsection*{%s}")
									("\\paragraph{%s}" . "\\paragraph*{%s}")
									("\\subparagraph{%s}" .
									 "\\subparagraph*{%s}")))
  )

;; (use-package ox
;;   :defer t
;;   :config
;;   ;; ** <<APS journals>>
;;   (add-to-list 'org-latex-classes '("revtex4-1"
;; 									"\\documentclass[aps,prl,twocolumn]{revtex4-1}
;; 																	[NO-DEFAULT-PACKAGES] [PACKAGES] [EXTRA]"
;; 									("\\section{%s}" . "\\section*{%s}")
;; 									("\\subsection{%s}" . "\\subsection*{%s}")
;; 									("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;; 									("\\paragraph{%s}" . "\\paragraph*{%s}")
;; 									("\\subparagraph{%s}" .
;; 									 "\\subparagraph*{%s}")))
;;   (add-to-list 'org-latex-classes '("nature"
;; 									"\\documentclass[fleqn,10pt]{wlscirep}
;; 																	[NO-DEFAULT-PACKAGES] [PACKAGES] [EXTRA]"
;; 									("\\section{%s}" . "\\section*{%s}")
;; 									("\\subsection{%s}" . "\\subsection*{%s}")
;; 									("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;; 									("\\paragraph{%s}" . "\\paragraph*{%s}")
;; 									("\\subparagraph{%s}" .
;; 									 "\\subparagraph*{%s}")))
;;   )
