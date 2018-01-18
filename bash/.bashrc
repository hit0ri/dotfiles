# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#
# FUNCTIONS
#

include() {
  if [[ -f $1 ]]; then
    source "$1"
  fi
}

twitch() {
  mpv "https://twitch.tv/$1"
}

cdl() {
  cd "$1" && ls
}

mkdirf() {
  mkdir -p "$1" && cd "$1"
}

# Create paste from stdin or file
pb() {
  curl -sF "c=@${1:--}" https://ptpb.pw/
}

# Create paste from stdin or file and copy url to the clipboard
pbc() {
  curl -sF "c=@${1:--}" \
       -w "%{redirect_url}" 'https://ptpb.pw/?r=1' \
       -o /dev/stderr \
    | xsel -l /dev/null -b
}

# Create expiring paste from stdin or file.
# Default paste lifetime is 30 minutes (1800 seconds)
pbe() {
  curl -sF "c=@${1:--}" -F sunset=${2:-1800} https://ptpb.pw/
}

# Create paste from stdin or file (base66 id)
pbp() {
  curl -sF "c=@${1:--}" -F p=1 https://ptpb.pw/
}

# Create paste from selected text
pbs() {
  if hash xsel &> /dev/null; then
    xsel -l /dev/null -p -o | curl -sF c=@- https://ptpb.pw/
  else
    printf "xsel: command not found...\n" 1>&2
  fi
}

# Create paste from ascinema and copy url to the clipboard
pba() {
if hash asciinema &> /dev/null; then
  local recfile=$(mktemp /tmp/term-rec-XXXX.json)
  asciinema rec "${recfile}"
  curl -sF "c=@${recfile}" \
       -w "%{redirect_url}" 'https://ptpb.pw/?r=1' \
       -o /dev/stderr \
    | sed 's|w/|w/t/|' \
    | xsel -l /dev/null -b
  rm "${recfile}"
else
  printf "asciinema: command not found...\n" 1>&2
fi
}


# Source /etc/bashrc on Fedora and RHEL as it's not sourced from /etc/profile
[[ -e /etc/redhat-release ]] && include /etc/bashrc

# Source profile on Solus
[[ -e /etc/solus-release ]] \
    && include /usr/share/defaults/etc/profile \
    && include ~/.profile

# Source bash-completion on debian based distros
include /etc/bash_completion

#
# SHELL OPTIONS
#

# History
# Ignore duplicates and lines which begin with a space
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%F %T> "
HISTSIZE=8192
shopt -s histappend

# Line wrap on window resize
shopt -s checkwinsize

# Colors for ls
[[ -f $HOME/.dircolors ]] && eval "$(dircolors -b $HOME/.dircolors)"


#
# PROMPT
#

# Git prompt
include /usr/share/git/completion/git-prompt.sh
include /usr/share/git-core/contrib/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"

# Colors
FG_BLACK='\[\e[30;1m\]'
FG_RED='\[\e[31;1m\]'
FG_GREEN='\[\e[32;1m\]'
FG_YELLOW='\[\e[33;1m\]'
FG_BLUE='\[\e[34;1m\]'
FG_MAGENTA='\[\e[35;1m\]'
FG_CYAN='\[\e[36;1m\]'
FG_WHITE='\[\e[37;1m\]'
TXT_RST='\[\e[0m\]'

set_prompt() {
  local -r EXIT=$?

  PS1="${SSH_TTY:+${FG_MAGENTA}\h${FG_WHITE} }"
  ((COLUMNS+${#HOME}-${#PWD} > COLUMNS/2)) && PS1+="${FG_BLUE}\w " || PS1+="${FG_BLUE}…/\W "
  [[ -d $PWD/.git ]] && PS1+="$(__git_ps1 "${FG_YELLOW}"%s)"
  ((EXIT)) && PS1+="${FG_RED}\$" || PS1+="${FG_GREEN}\$"
  PS1+="$TXT_RST "
}

PROMPT_COMMAND="set_prompt"

# show file, line number and function for xtrace mode
export PS4='+(${BASH_SOURCE/##}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'


#
# ALIASES
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

alias ls='ls --color=auto --show-control-chars --group-directories-first -XF'
alias ll='ls --color=auto --show-control-chars --group-directories-first -lXF'
alias lsa='ls --color=auto --show-control-chars --group-directories-first -AXF'
alias lla='ls --color=auto --show-control-chars --group-directories-first -AlXF'

alias dmesg='dmesg -exL'
alias ip='ip --color'
alias ips='ip --color --stats'
alias ipinfo=$'ip -4 -o a | awk \'BEGIN { OFS = ":\t "} { print $2, $4 }\''

alias vim='nvim'
alias gap='git add --patch'
alias gst='git status'
alias lsports='ss -tunalp | column -t'

#
# FZF
#

include $HOME/.fzf.bash
