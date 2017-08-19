;; LaTeX editing settings
;; Fundamental
(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t))

(add-hook 'LaTeX-mode-hook 'set-buffer-olivetti-variable-pitch)

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
