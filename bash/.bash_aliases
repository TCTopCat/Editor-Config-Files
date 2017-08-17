#Folder Viewing and  Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias l='ls -t --color --group-directories-first'
alias ll='l -l'
alias la='l -A'
alias c='clear'
alias u='c && l' 
alias l.='c && la -d .*'

alias desk='cd ~/Desktop && c'
alias doc='cd ~/Documents && c'
alias dow='cd ~/Downloads && c'
alias drop='cd ~/Dropbox'
alias phd='cd ~/PhD'
alias qp='cd ~/Dropbox/Q-Plate'
alias notes='cd ~/Documents/Physics/GeneralNotes'
alias supa='cd /home/tc/Documents/PhD/SUPA'
alias exp='cd /home/tc/Documents/PhD/ColdAtomTable'
alias the='cd /home/tc/Dropbox/Thesis/'
alias th='cd /home/tc/Dropbox/Thesis/LaTeX_Files	&& gvim -p 2016ClarkPhD.tex /home/tc/texmf/tex/latex/StyleFiles/Thesis/2016ClarkPhD.cls && exit'
alias dfs='cd /home/tc/texmf/tex/latex/StyleFiles/Thesis/Definitions-Maths && gvim -p MathsDefs.tex MDs-Logic.tex MDs-Light.tex MDs-Atoms.tex MDs-Quantum.tex MDs-Units.tex  && exit'


#Programs
<<<<<<< HEAD
alias e='emacsclient --alternate-editor="emacs" -c --frame-parameters="((height . 80) (width . 83) (left . 1500))" '
=======
alias e='emacsclient --alternate-editor="emacs" -e "(select-frame-set-input-focus (selected-frame))" -c '
>>>>>>> bd03ac3b3f0809447647547bc6660eb0f1e597d1

