#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_RUNTIME_DIR=/run/user/$(id -u)

# My aliases
alias nv='nvim'
alias vi='nvim'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -latr'
alias grep='grep --color=auto'
alias open='xdg-open'
alias hostname='hostnamectl hostname'
alias nb='newsboat'
alias t='tmux'

# My scripts
alias us="~/.scripts/update-snapshot.sh"
alias sqr="~/.scripts/scan-qr.sh"

# My prompt
PS1='[\u@\h \W]\$ '

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Set vi mode
set -o vi
bind "\"\C-l\": clear-screen" # otherwise Ctrl-l is unbound
