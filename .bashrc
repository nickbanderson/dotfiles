#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias du='du -h'
PS1="\[\e[1;34m\]\w > \[\e[m\]"

export PATH="$PATH:$HOME/util"
export EDITOR='vim'
# set -o vi

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
