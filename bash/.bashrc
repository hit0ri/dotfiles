# Functions

include() {
    [[ -f "$1" ]] && source "$1"
}

twitch() {
    mpv "http://twitch.tv/$1"
}

pb() {
    curl -F "c=@${1:--}" https://ptpb.pw/
}

pbx() {
    curl -sF "c=@${1:--}" -w "%{redirect_url}" 'https://ptpb.pw/?r=1' -o /dev/stderr | xsel -l /dev/null -b
}

pbs() {
    scrot /tmp/$$.png && pbx /tmp/$$.png && rm /tmp/$$.png
}


# Source global definitions
include /etc/bashrc
include /etc/bash.bashrc

# Enable bash-completion
include /usr/share/bash-completion/bash_completion

# Open new tabs in the $PWD
include /etc/profile.d/vte.sh

export EDITOR=nvim
export SUDO_EDITOR=nvim
if type google-chrome &> /dev/null; then
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

# Line wrap on window resize
shopt -s checkwinsize

# Colors for ls
if type dircolors &>/dev/null; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Git prompt
include /usr/share/git-core/contrib/completion/git-prompt.sh
include /usr/share/git/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"

# Prompt
set_prompt() {
    local EXIT="$?"
    FG_BLACK="\[$(tput setaf 0)\]"
    FG_RED="\[$(tput setaf 1)\]"
    FG_GREEN="\[$(tput setaf 2)\]"
    FG_YELLOW="\[$(tput setaf 3)\]"
    FG_BLUE="\[$(tput setaf 4)\]"
    FG_MAGENTA="\[$(tput setaf 5)\]"
    FG_CYAN="\[$(tput setaf 6)\]"
    FG_WHITE="\[$(tput setaf 7)\]"
    BG_BLACK="\[$(tput setab 0)\]"
    BG_RED="\[$(tput setab 1)\]"
    BG_GREEN="\[$(tput setab 2)\]"
    BG_YELLOW="\[$(tput setab 3)\]"
    BG_BLUE="\[$(tput setab 4)\]"
    BG_MAGENTA="\[$(tput setab 5)\]"
    BG_CYAN="\[$(tput setab 6)\]"
    BG_WHITE="\[$(tput setab 7)\]"
    BOLD="\[$(tput bold)\]"
    RESET="\[$(tput sgr0)\]"

    PS1="${BOLD}${FG_WHITE}┌╼"
    if [[ -n "$SSH_CONNECTION" ]]; then
        PS1+="[${FG_YELLOW}\h${FG_WHITE}]╺─╸"
    fi
    PS1+="[${FG_GREEN}\w${FG_WHITE}]"
    PS1+="$(__git_ps1 ╺─╸[${FG_BLUE}%s${FG_WHITE}])"
    if [[ ${EXIT} -ne 0 ]]; then
        PS1+="╺─╸[${FG_RED}${EXIT}${FG_WHITE}]"
    fi
    PS1+="\n└╼${RESET} "
}

PROMPT_COMMAND=set_prompt


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

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias zgrep='zgrep --color=auto'

alias  ls='ls --color=auto --show-control-chars --group-directories-first -hXF'
alias  ll='ls --color=auto --show-control-chars --group-directories-first -lhXF'
alias lsa='ls --color=auto --show-control-chars --group-directories-first -AhXF'
alias lla='ls --color=auto --show-control-chars --group-directories-first -AlhXF'

alias dmesg='dmesg -exL'
alias vim='nvim'
alias svim='sudoedit'
alias gap='git add --patch'
alias lsports='ss -tunalp | cat'
alias dstats='dstat -cdnpmgs --top-bio --top-cpu'
alias ip='ip --stats --color'
