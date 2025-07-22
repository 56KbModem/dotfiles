#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_RUNTIME_DIR=/run/user/$(id -u)

# My aliases
alias vi="vim"
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -latr'
alias grep='grep --color=auto'

# My scripts
alias git-key="~/.scripts/git-key.sh"
# My prompt
PS1='[\u@\h \W]\$ '

# Start ssh-agent on shell startup
eval "$(ssh-agent -s)"

