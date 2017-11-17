;; Keep org up-to-date ?? Need better way to do this

;; ORG helper Functions
(setq org-enforce-todo-dependencies t)
(defun find-main-todo-file ()
  "Opens the main to-do file."
  (interactive)
  (find-file-other-window "~/Documents/ORG-mode/TODOs.org"))

(use-package org
  ;; :ensure org-plus-contrib
  :defer 7
  :config
  (use-package org-download)
  ;; LaTeX hook settings
  (add-hook 'LaTeX-mode-hook 'flyspell-mode t)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (setq org-latex-create-formula-image-program 'imagemagick)
  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t)
  (setq org-pretty-entities t)
  (org-babel-do-load-languages 'org-babel-load-languages '((latex . t)))
  (setq org-babel-default-header-args:latex
		'((:results . "raw")))
  :bind
  (("C-c t" . find-main-todo-file)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-c l " . org-store-link)
   ("C-c b " . org-iswitchb)))
(eval-after-load 'org
  '(setf org-highlight-latex-and-related '(latex script entities)))


(use-package org-ref
  :after org
  :init
  (setq reftex-default-bibliography '("~/Documents/Postdoc-Glasgow/references.bib"))
  (setq org-ref-bibliography-notes "~/Documents/Postdoc-Glasgow/BibNotes/bib-notes.org"
		org-ref-default-bibliography '("~/Documents/Postdoc-Glasgow/references.bib")
		org-ref-pdf-directory "~/Documents/Postdoc-Glasgow/Papers/")
  (setq helm-bibtex-bibliography  "~/Documents/Postdoc-Glasgow/references.bib/")
  (setq helm-bibtex-library-path "~/Documents/Postdoc-Glasgow/Papers/"))


;; Custom capture templates
(setq org-capture-templates
	  '(("t" "todo" entry (file org-default-notes-file)
		 "* TODO %?\n%u\n%a\n" :clock-in t :clock-resume t)
		("m" "Meeting" entry (file org-default-notes-file)
		 "*MEETING with %? :MEETING:\n%t" :clock-in t :clock-resume
		 ("i" "Idea" entry (file org-default-notes-file)
		  "* %? :IDEA: \n%t" :clock-in t :clock-resume t)
		 ("n" "Next Task" entry (file+headline org-default-notes-file "Tasks")
		  "** NEXT %? \nDEADLINE: %t"))))

;; ORG display
(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda ()
							 (org-bullets-mode 1)
							 (org-indent-mode 1)
							 )))

;; TODO: drag-n-drop file to org document inserts link to file

;; ORG presentations
(use-package ox-reveal
  :config
  (setq org-reveal-root "file:///home/tc/Emacs/Presentation/reveal.js")
  )


;; Hack to get pdf images to display inline
(setq image-file-name-extensions
	  (quote
	   ("png" "jpeg" "jpg" "gif" "tiff" "tif" "xbm" "xpm" "pbm" "pgm" "ppm" "pnm" "svg" "pdf" "bmp")))

(setq org-image-actual-width 400)

(setq org-imagemagick-display-command "convert -density 600 \"%s\" -thumbnail \"%sx%s>\" \"%s\"")
(defun org-display-inline-images (&optional include-linked refresh beg end)
  "Display inline images.
Normally only links without a description part are inlined, because this
is how it will work for export.  When INCLUDE-LINKED is set, also links
with a description part will be inlined.  This
can be nice for a quick
look at those images, but it does not reflect what exported files will look
like.
When REFRESH is set, refresh existing images between BEG and END.
This will create new image displays only if necessary.
BEG and END default to the buffer boundaries."
  (interactive "P")
  (unless refresh
    (org-remove-inline-images)
    (if (fboundp 'clear-image-cache) (clear-image-cache)))
  (save-excursion
    (save-restriction
      (widen)
      (setq beg (or beg (point-min)) end (or end (point-max)))
      (goto-char beg)
      (let ((re (concat "\\[\\[\\(\\(file:\\)\\|\\([./~]\\)\\)\\([^]\n]+?"
                        (substring (org-image-file-name-regexp) 0 -2)
                        "\\)\\]" (if include-linked "" "\\]")))
            old file ov img)
        (while (re-search-forward re end t)
          (setq old (get-char-property-and-overlay (match-beginning 1)
                                                   'org-image-overlay)
				file (expand-file-name
                      (concat (or (match-string 3) "") (match-string 4))))
          (when (file-exists-p file)
            (let ((file-thumb (format "%s%s_thumb.png" (file-name-directory file) (file-name-base file))))
              (if (file-exists-p file-thumb)
                  (let ((thumb-time (nth 5 (file-attributes file-thumb 'string)))
                        (file-time (nth 5 (file-attributes file 'string))))
                    (if (time-less-p thumb-time file-time)
						(shell-command (format org-imagemagick-display-command
											   file org-image-actual-width org-image-actual-width file-thumb) nil nil)))
                (shell-command (format org-imagemagick-display-command
									   file org-image-actual-width org-image-actual-width file-thumb) nil nil))
              (if (and (car-safe old) refresh)
                  (image-refresh (overlay-get (cdr old) 'display))
                (setq img (save-match-data (create-image file-thumb)))
                (when img
                  (setq ov (make-overlay (match-beginning 0) (match-end 0)))
                  (overlay-put ov 'display img)
                  (overlay-put ov 'face 'default)
                  (overlay-put ov 'org-image-overlay t)
                  (overlay-put ov 'modification-hooks
                               (list 'org-display-inline-remove-overlay))
                  (push ov org-inline-image-overlays))))))))))
