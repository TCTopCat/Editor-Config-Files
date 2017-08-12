(require 'ox)
;; (require 'ox-publish)

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
