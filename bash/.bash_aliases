#Folder Viewing and  Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias l='ls --color --group-directories-first'
alias ll='l -l'
alias la='l -A'
alias c='clear'
alias u='c && l' 
alias l.='c && la -d .*'

#Folder shortcuts
alias con='cd ~/config-files && u'
alias desk='cd ~/Desktop && c'
alias doc='cd ~/Documents && c'
alias dow='cd ~/Downloads && c'
alias drop='cd ~/Dropbox'
alias wig='cd ~/Wigner'
alias vim='nvim'

#Programs
function e() { emacsclient -c "$@"  --alternate-editor="emacs"  --frame-parameters="((height . 80) (width . 83) (left . 1500))" ; }
#function e() { emacsclient -c "$@"  -e "(select-frame-set-input-focus (selected-frame))" --alternate-editor="emacs"  --frame-parameters="((height . 80) (width . 83) (left . 1500))" ; }
#alias e='emacsclient --alternate-editor="emacs" -e "(select-frame-set-input-focus (selected-frame))" -c '

alias pacu='pacaur -Syyu'
