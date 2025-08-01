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

# My scripts
alias git-key="~/.scripts/git-key.sh"
alias us="~/.scripts/update-snapshot.sh"

# My prompt
PS1='[\u@\h \W]\$ '

