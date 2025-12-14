#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_RUNTIME_DIR=/run/user/$(id -u)

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# My prompt (with colors)
PS1="[\u@\h \[\033[1;34m\]\W\[\033[0m\]]\$ "

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Set vi mode
set -o vi
bind "\"\C-l\": clear-screen" # otherwise Ctrl-l is unbound
