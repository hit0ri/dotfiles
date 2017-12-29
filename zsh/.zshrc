setopt auto_cd \
       pushd_silent \
       complete_aliases \
       no_nomatch \
       extended_glob \
       hist_fcntl_lock \
       hist_ignore_all_dups \
       hist_ignore_space \
       hist_reduce_blanks \
       hist_save_no_dups \
       hist_verify \
       share_history \
       interactive_comments \
       prompt_subst

HISTFILE=~/.zhistory
HISTSIZE=8192
SAVEHIST=$HISTSIZE

REPORTTIME=10
WORDCHARS='*?_[]~&;!#$%^(){}<>'



#
# FUNCTIONS
#

include() {
  if [[ -f $1 ]]; then
    source "$1"
  fi
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



autoload -Uz compinit
zmodload zsh/complist

zstyle ':completion:*'          verbose true
zstyle ':completion:*'          menu select
zstyle ':completion:*'          use-cache true
zstyle ':completion:*'          rehash true
zstyle ':completion:*'          list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*'          matcher-list '' 'm:{a-z-_}={A-Z_-}'
zstyle ':completion:*'          group-name ''
zstyle ':completion:*'          format "%B%F{green}%d:%f%b"
zstyle ':completion:*:messages' format "%B%F{white}%d:%f%b"
zstyle ':completion:*:warnings' format "%B%F{red}- no match in:%f%b %d"
zstyle ':completion:*:matches'  group true
zstyle ':completion:*functions' ignored-patterns '_*'



prompt_precmd() {
  # shows the current dir in the title when there are no active processes
  print -Pn "\e]0;$PWD:t\a"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd prompt_precmd



# Use EMACS emulation mode
bindkey -e

KEYTIMEOUT=10

bindkey ' ' magic-space

# Backspace
bindkey $terminfo[kbs]   backward-delete-char

# Insert
bindkey $terminfo[kich1] overwrite-mode

# Delete
bindkey $terminfo[kdch1] delete-char

# Home
bindkey $terminfo[khome] beginning-of-line
bindkey '^[[H'           beginning-of-line

# End
bindkey $terminfo[kend]  end-of-line
bindkey '^[[F'           end-of-line

# Home
bindkey $terminfo[kpp]   beginning-of-buffer-or-history

# End
bindkey $terminfo[knp]   end-of-buffer-or-history

# Up
autoload -Uz up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey $terminfo[kcuu1] up-line-or-beginning-search
bindkey '^[[A'           up-line-or-beginning-search

# Down
autoload -Uz down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey $terminfo[kcud1] down-line-or-beginning-search
bindkey '^[[B'           down-line-or-beginning-search

# Shift-Tab
bindkey $terminfo[kcbt]  reverse-menu-complete



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
alias ipinfo=$'ip -4 -o a | awk \'BEGIN { OFS = ":\t" } { print $2, $4 }\''

alias vim='nvim'
alias gap='git add --patch'
alias gst='git status'
alias lsports='ss -tunalp | column -t'

# BASH-like help
autoload -Uz run-help
alias help='run-help'

# antibody
if [[ -f ~/.antibody-bundles ]]; then
  if hash antibody &> /dev/null; then
    antibody bundle < ~/.antibody-bundles > ~/.zbundles
  fi
fi
include ~/.zbundles

compinit

include ~/.fzf.zsh
