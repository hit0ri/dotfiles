
# Functions

include() {
    [[ -r "$1" ]] && . "$1"
}

command_exists() {
    command -v "$1" &> /dev/null
}

twitch() {
    mpv "http://twitch.tv/$1"
}

pb() {
    curl -F "c=@${1:--}" https://ptpb.pw/
}

pbp() {
    curl -F 'p=1' -F "c=@${1:--}" https://ptpb.pw/
}

pbc() {
    curl -sF "c=@${1:--}" -w "%{redirect_url}" 'https://ptpb.pw/?r=1' \
         -o /dev/stderr | xsel -l /dev/null -b
}

pbs() {
    scrot /tmp/$$.png && pbx /tmp/$$.png && rm /tmp/$$.png
}

p() {
    xsel -l /dev/null -p -o | curl -F "c=@${1:--}" https://ptpb.pw/
}

mkdirf() {
    mkdir "$1" && cd "$1"
}


# Source global definitions
include /etc/bash.bashrc
include /etc/bashrc

# Open new tabs in the $PWD
include /etc/profile.d/vte.sh

export PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.node_modules/bin:$HOME/go/bin
export npm_config_prefix=$HOME/.node_modules

export EDITOR=nvim
export SUDO_EDITOR=$EDITOR

if command_exists google-chrome; then
    export BROWSER=google-chrome
else
    export BROWSER=chromium
fi

export GOPATH=~/go
export WINEDLLOVERRIDES=winemenubuilder.exe,mscoree,mshtml=

export PAGER=less
export LESS=-RX
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'

# History
# Ignore duplicates and lines which begin with a space
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%h %d %H:%M:%S> "
export HISTSIZE=8192
shopt -s histappend


# Line wrap on window resize
shopt -s checkwinsize

# Colors for ls
if command_exists dircolors; then
    [[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Git prompt
include /usr/share/git/completion/git-prompt.sh
include /usr/share/git-core/contrib/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"

# Prompt
set_prompt() {
    local EXIT=$?
    local FG_BLACK="\[$(tput setaf 0)\]"
    local FG_RED="\[$(tput setaf 1)\]"
    local FG_GREEN="\[$(tput setaf 2)\]"
    local FG_YELLOW="\[$(tput setaf 3)\]"
    local FG_BLUE="\[$(tput setaf 4)\]"
    local FG_MAGENTA="\[$(tput setaf 5)\]"
    local FG_CYAN="\[$(tput setaf 6)\]"
    local FG_WHITE="\[$(tput setaf 7)\]"
    local BG_BLACK="\[$(tput setab 0)\]"
    local BG_RED="\[$(tput setab 1)\]"
    local BG_GREEN="\[$(tput setab 2)\]"
    local BG_YELLOW="\[$(tput setab 3)\]"
    local BG_BLUE="\[$(tput setab 4)\]"
    local BG_MAGENTA="\[$(tput setab 5)\]"
    local BG_CYAN="\[$(tput setab 6)\]"
    local BG_WHITE="\[$(tput setab 7)\]"
    local BOLD="\[$(tput bold)\]"
    local RESET="\[$(tput sgr0)\]"

    PS1="$BOLD"
    PS1+="${SSH_TTY:+${FG_MAGENTA}\h${FG_WHITE} }"
    PS1+="${FG_BLUE}\w "
    PS1+="$(__git_ps1 ${FG_YELLOW}%s)"
    (($EXIT)) && PS1+="${FG_RED}\$" || PS1+="${FG_GREEN}\$"
    PS1+="$RESET "
}

export PROMPT_COMMAND="set_prompt; history -a; history -c; history -r"


# Aliases
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

alias rm='rm -vI'
alias cp='cp -vi'
alias mv='mv -vi'
alias ln='ln -vi'
alias mkdir='mkdir -vp'

alias chmod='chmod -c --preserve-root'
alias chown='chown -c --preserve-root'
alias chgrp='chgrp -c --preserve-root'

alias  grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias zgrep='zgrep --color=auto'

alias  ls='ls --color=auto --show-control-chars --group-directories-first -hXF'
alias  ll='ls --color=auto --show-control-chars --group-directories-first -lhXF'
alias lsa='ls --color=auto --show-control-chars --group-directories-first -AhXF'
alias lla='ls --color=auto --show-control-chars --group-directories-first -AlhXF'

alias dmesg='dmesg -exL'
alias ip='ip --stats --color'

alias vim='nvim'
alias svim='sudoedit'
alias gap='git add --patch'
alias lsports='ss -tunalp | cat'
alias dstats='dstat -cdnpmgs --top-bio --top-cpu'
