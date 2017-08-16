#!/usr/local/bin/bash -f

# start emacs server
emacs --daemon

# emacs client
emacsclient -c $argv
