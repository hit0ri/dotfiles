# .bashrc


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source /etc/bashrc on Fedora and RHEL as it's not sourced from /etc/profile
[[ -e /etc/redhat-release ]] && . /etc/bashrc

# Source profile on Solus
if [[ -e /etc/solus-release ]]; then
  . /usr/share/defaults/etc/profile
  . "$HOME/.profile"
fi

# Source bash-completion on debian based distros
[[ -r /etc/bash_completion ]] && . /etc/bash_completion

#
# SHELL OPTIONS
#

# History
# Ignore duplicates and lines which begin with a space
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%F %T> "
HISTSIZE=8192
shopt -s histappend
shopt -s cmdhist

# Line wrap on window resize
shopt -s checkwinsize

# Colors for ls
if [[ -r $HOME/.dircolors ]] && [[ ! -e /etc/solus-release ]]; then
  eval "$(dircolors -b $HOME/.dircolors)"
fi


#
# PROMPT
#

set_prompt() {
  local -r EXIT=$?
  local -r HAS_JOBS=$(jobs -p)

  # Colors
  local -r FG_BLACK='\[\e[30;1m\]' \
           FG_RED='\[\e[31;1m\]' \
           FG_GREEN='\[\e[32;1m\]' \
           FG_YELLOW='\[\e[33;1m\]' \
           FG_BLUE='\[\e[34;1m\]' \
           FG_MAGENTA='\[\e[35;1m\]' \
           FG_CYAN='\[\e[36;1m\]' \
           FG_WHITE='\[\e[37;1m\]' \
           TXT_RST='\[\e[0m\]'

  if command -v git &> /dev/null; then
    if git rev-parse --is-inside-work-tree &> /dev/null; then
      local -r branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    fi
  fi

  PS1="${SSH_TTY:+${FG_MAGENTA}\h }"
  PS1+="${FG_BLUE}\w "
  PS1+="${branch:+${FG_MAGENTA}${branch} }"
  PS1+="${VIRTUAL_ENV:+${FG_YELLOW}${VIRTUAL_ENV##*/} }"
  PS1+="${HAS_JOBS:+${FG_BLACK}[\j] }"
  if ((EXIT)); then
    PS1+="${FG_RED}\$ "
  else
    PS1+="${FG_GREEN}\$ "
  fi
  PS1+="$TXT_RST"
}

PROMPT_DIRTRIM=4
PROMPT_COMMAND="set_prompt"
PS4='+(${BASH_SOURCE/##}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'


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

alias vim='nvim'
alias gap='git add --patch'
alias gst='git status'
alias lsports='ss -tunalp | cat'

if [[ -r /usr/share/fzf/shell/key-bindings.bash ]]; then
  . /usr/share/fzf/shell/key-bindings.bash
elif [[ -r /usr/share/fzf/key-bindings.bash ]]; then
  . /usr/share/fzf/key-bindings.bash
elif [[ -r /usr/share/doc/fzf/examples/key-bindings.bash ]]; then
  . /usr/share/doc/fzf/examples/key-bindings.bash
elif [[ -r $HOME/.fzf.bash ]]; then
  . $HOME/.fzf.bash
fi

. "$HOME/.functions.sh"
