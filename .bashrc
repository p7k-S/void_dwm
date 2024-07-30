# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=3000
#set -o vi

# force_color_prompt=yes

# echo -e -n "\x1b[\x33 q" # changes to blinking underline

alias ..='cd ..'
alias cat='bat'
alias cal='cal -m'

alias ls='ls --color=auto'
alias la='exa -la'
alias  l='exa  -a'

# alias sudo='doas'
#
alias   pi='ping ya.ru'

alias  xi='doas xbps-install -Syu'
alias  xq='xbps-query -Rs'
alias  xr='doas xbps-remove'

alias  bn='doas ln -s /etc/sv/bluetoothd/ /var/service && bluetoothctl'
alias  bd='doas rm /var/service/bluetoothd'
alias   r='doas reboot'
alias   p='doas poweroff'
alias   v='nvim'

# alias ds="cd ~ && cd \$(find * -type d | fzf)"
alias  sd="cd ~ && cd \$(fd --hidden --type d --exclude .git --exclude go | fzf-tmux)"
alias  sf="fd --hidden --type f --exclude .git | fzf-tmux | xargs nvim"
alias sdf="sd && sf"  # золото, еще добавить в tmux и просто ну ахуй

# alias sdfcd="sd && pwd | xclip -selection clipboard && sf"  # золото, еще добавить в tmux и просто ну ахуй

alias scr="tmux attach -t scrpad"
alias tcode="sd && /home/pavel/.tmux/tcode.sh"
# alias tcode="sd && pwd | xclip -selection clipboard && cd && clear && tmux attach -t code"

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
# PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;146m\]\u\[\e[m\]@\[\e[38;5;113m\]\h\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "
PS1="\[\e[1;31m\]\$(parse_git_branch)\[\033[34m\]\$(parse_git_dirty)\n\[\033[1;33m\]  \[\e[1;37m\] \w \[\e[1;36m\] \[\e[0;39m\] "



function parse_git_dirty {
  STATUS="$(git status 2> /dev/null)"
  if [[ $? -ne 0 ]]; then printf ""; return; else printf " ["; fi
  if echo "${STATUS}" | grep -c "renamed:"         &> /dev/null; then printf " >"; else printf ""; fi
  if echo "${STATUS}" | grep -c "branch is ahead:" &> /dev/null; then printf " !"; else printf ""; fi
  if echo "${STATUS}" | grep -c "new file::"       &> /dev/null; then printf " +"; else printf ""; fi
  if echo "${STATUS}" | grep -c "Untracked files:" &> /dev/null; then printf " ?"; else printf ""; fi
  if echo "${STATUS}" | grep -c "modified:"        &> /dev/null; then printf " *"; else printf ""; fi
  if echo "${STATUS}" | grep -c "deleted:"         &> /dev/null; then printf " -"; else printf ""; fi
  printf " ]"
}

parse_git_branch() {
  git rev-parse --abbrev-ref HEAD 2> /dev/null
}

prompt_comment() {
    DIR="$HOME/.local/share/promptcomments/"
    MESSAGE="$(find "$DIR"/*.txt | shuf -n1)"
    cat "$MESSAGE"
}

export EDITOR=nvim
# export BROWSER=/home/pavel/.config/thorium/thorium
