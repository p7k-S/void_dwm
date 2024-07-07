# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=3000
#set -o vi

# echo -e -n "\x1b[\x33 q" # changes to blinking underline

alias ..='cd ..'
# alias vim='nvim'
alias cat='bat'

alias ls='ls --color=auto'
alias la='exa -la'
alias  l='exa  -a'

# alias sudo='doas'

alias  bn='doas ln -s /etc/sv/bluetoothd/ /var/service'
alias  bd='doas rm /var/service/bluetoothd'
# alias  sl='systemctl'

#man
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# PS1='[\u@\h \W]\$ '   27
PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;146m\]\u\[\e[m\]@\[\e[38;5;113m\]\h\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "

