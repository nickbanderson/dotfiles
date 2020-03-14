#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# move to i3 on a exec_always so i can just mod+shift+r to do this and set everything else too
alias g502="xinput --set-prop 'Logitech Gaming Mouse G502' 'libinput Accel Profile Enabled' 0, 1 ; xinput --set-prop 'Logitech Gaming Mouse G502' 'libinput Accel Speed' -.1"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
