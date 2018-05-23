# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#
# FUNCTIONS
#

function include {
  if [[ -f $1 ]]; then
    source "$1"
  fi
}

include ~/.functions.sh


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

PROMPT_DIRTRIM=4

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
  local -r HAS_JOBS=$(jobs -p)

  if $(git rev-parse --is-inside-work-tree 2> /dev/null); then
    # Get the current branch name
    local -r branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  fi

  PS1="${TMUX:+${FG_YELLOW}t }"
  PS1+="${SSH_TTY:+${FG_MAGENTA}\h }"
  PS1+="${FG_BLUE}\w "
  PS1+="${branch:+${FG_MAGENTA}${branch} }"
  PS1+="${VIRTUAL_ENV:+${FG_YELLOW}${VIRTUAL_ENV##*/} }"
  PS1+="${HAS_JOBS:+${FG_BLACK}[\j] }"
  ((EXIT)) && PS1+="${FG_RED}\$ " || PS1+="${FG_GREEN}\$ "
  PS1+="$TXT_RST"
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

include /usr/share/fzf/shell/key-bindings.bash
