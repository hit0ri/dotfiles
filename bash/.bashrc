# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#
# Functions
#

include() {
  [[ -f $1 ]] && . "$1"
}

twitch() {
  mpv "https://twitch.tv/$1" &
}

cdl() {
  cd "$1" && ls
}

mkdirf() {
  mkdir -p "$1" && cd "$1"
}

# Create paste from stdin or file
pb() {
  curl -F "c=@${1:--}" https://ptpb.pw/
}

# Create paste from stdin or file and copy url to the clipboard
pbc() {
  curl -sF "c=@${1:--}" -w "%{redirect_url}" 'https://ptpb.pw/?r=1' -o /dev/stderr | xsel -l /dev/null -b
}

# Create expiring paste from stdin or file.
# Default paste lifetime is 2 minutes (120 seconds)
pbe() {
  curl -F "c=@${1:--}" -F sunset=${2:-120} https://ptpb.pw/
}

# Create paste from stdin or file (base66 id)
pbp() {
  curl -F "c=@${1:--}" -F p=1 https://ptpb.pw/
}

# Create paste from selected text
pbs() {
  xsel -l /dev/null -p -o | curl -F c=@- https://ptpb.pw/
}



# Source global definitions
include /etc/bash.bashrc
include /etc/bashrc




#
# Shell options
#

# History
# Ignore duplicates and lines which begin with a space
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%h %d %H:%M:%S> "
HISTSIZE=8192
shopt -s histappend

# Line wrap on window resize
shopt -s checkwinsize

# Colors for ls
if command -v dircolors &> /dev/null ; then
  [[ -f $HOME/.dircolors ]] && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
fi


#
# Prompt
#

# Git prompt
include /usr/share/git/completion/git-prompt.sh
include /usr/share/git-core/contrib/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"

# Colors
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
TXT_BOLD="\[$(tput bold)\]"
TXT_RST="\[$(tput sgr0)\]"

set_prompt() {
  local -r EXIT=$?

  PS1="$TXT_BOLD"
  PS1+="${SSH_TTY:+${FG_MAGENTA}\h${FG_WHITE} }"
  ((COLUMNS+${#HOME}-${#PWD} > COLUMNS/2)) && PS1+="${FG_BLUE}\w " || PS1+="${FG_BLUE}…/\W "
  [[ -d $PWD/.git ]] && PS1+="$(__git_ps1 "${FG_YELLOW}"%s)"
  ((EXIT)) && PS1+="${FG_RED}\$" || PS1+="${FG_GREEN}\$"
  PS1+="$TXT_RST "
}

PROMPT_COMMAND="set_prompt; history -a; history -c; history -r"

# show file, line number and function for xtrace mode
export PS4='+(${BASH_SOURCE/##}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'


#
# Aliases
#

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

alias rm='rm -vI'
alias cp='cp -vi'
alias mv='mv -vi'
alias ln='ln -vi'
alias mkdir='mkdir -v'

alias chmod='chmod -c --preserve-root'
alias chown='chown -c --preserve-root'
alias chgrp='chgrp -c --preserve-root'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias zgrep='zgrep --color=auto'

alias ls='ls --color=auto --show-control-chars --group-directories-first -hXF'
alias ll='ls --color=auto --show-control-chars --group-directories-first -lhXF'
alias lsa='ls --color=auto --show-control-chars --group-directories-first -AhXF'
alias lla='ls --color=auto --show-control-chars --group-directories-first -AlhXF'

alias dmesg='dmesg -exL'
alias ip='ip --color'
alias ips='ip --color --stats'
alias ipinfo=$'ip -4 -o a | awk \'{ print $2, $4 }\' | column -t'

alias vim='nvim'
alias gap='git add --patch'
alias gst='git status'
alias lsports='ss -tunalp | column -t'
