#
# Shell options
#

export KEYTIMEOUT=10
export WORDCHARS='*?_[]~&;!#$%^(){}<>'

# Report CPU usage for commands running longer than 10 seconds
REPORTTIME=10

# History
HISTFILE=~/.histfile
HISTSIZE=8192
SAVEHIST=8192

setopt share_history \
       extended_history \
       hist_ignore_dups \
       hist_reduce_blanks \
       hist_fcntl_lock \
       hist_ignore_space \
       auto_cd \
       pushd_silent \
       complete_aliases \
       glob_dots \
       interactive_comments

# Help
autoload -U run-help
autoload run-help-git
alias help='run-help'



#
# Functions
#

ifsource() {
    [[ -f $1 ]] && source "$1"
}

command_exists() {
    command -v "$1" &> /dev/null
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

# create paste from stdin or file
pb() {
    curl -F "c=@${1:--}" https://ptpb.pw/
}

# create paste from stdin or file and copy url to the clipboard
pbc() {
    curl -sF "c=@${1:--}" -w "%{redirect_url}" 'https://ptpb.pw/?r=1' -o /dev/stderr | xsel -l /dev/null -b
}

# create expiring paste from stdin or file
# default paste lifetime is 2 minutes (120 seconds)
pbe() {
    curl -F "c=@${1:--}" -F sunset=${2:-120} https://ptpb.pw/
}

# create paste from stdin or file (base66 id)
pbp() {
    curl -F "c=@${1:--}" -F p=1 https://ptpb.pw/
}

# create paste from selected text
pbs() {
    xsel -l /dev/null -p -o | curl -F c=@- https://ptpb.pw/
}



#
# Key bindings
#

typeset -gA key
key=(
    'left'      "${terminfo[kcub1]}"
    'right'     "${terminfo[kcuf1]}"
    'up'        "${terminfo[kcuu1]}"
    'down'      "${terminfo[kcud1]}"
    'backspace' "${terminfo[kbs]}"
    'delete'    "${terminfo[kdch1]}"
    'insert'    "${terminfo[kich1]}"
    'home'      "${terminfo[khome]}"
    'end'       "${terminfo[kend]}"
    'page-up'   "${terminfo[kpp]}"
    'page-down' "${terminfo[knp]}"
    'shift-tab' "${terminfo[kcbt]}"
)

bindkey -e
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey ' '       magic-space

bindkey '^[[1;3D' backward-word                  # alt  arrow left
bindkey '^[[1;3C' forward-word                   # alt  arrow right
bindkey '^[[1;5D' backward-word                  # ctrl arrow left
bindkey '^[[1;5C' forward-word                   # ctrl arrow right
bindkey '^[[A'    up-line-or-beginning-search    # arrow up
bindkey '^[[B'    down-line-or-beginning-search  # arrow down
bindkey '^[[H'    beginning-of-line              # home
bindkey '^[[F'    end-of-line                    # end

bindkey "${key[up]}"        up-line-or-beginning-search
bindkey "${key[down]}"      down-line-or-beginning-search
bindkey "${key[backspace]}" backward-delete-char
bindkey "${key[delete]}"    delete-char
bindkey "${key[insert]}"    overwrite-mode
bindkey "${key[home]}"      beginning-of-line
bindkey "${key[end]}"       end-of-line
bindkey "${key[page-up]}"   beginning-of-buffer-or-history
bindkey "${key[page-down]}" end-of-buffer-or-history
bindkey "${key[shift-tab]}" reverse-menu-complete



#
# Completion
#

autoload -Uz compinit
compinit

# activate menu
zstyle ':completion:*' menu yes

if [[ "$NOMENU" -eq 0 ]] ; then
    # if there are more than 5 options allow selecting from a menu
    zstyle ':completion:*' menu select=5
else
    # don't use any menus at all
    setopt no_auto_menu
fi

# rehash executables in PATH
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' rehash true

# color completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# activate approximate completion, but only after regular completion (_complete)
# zstyle ':completion:::::' completer _complete _approximate

# allow one error for every three characters typed in approximate completer
zstyle ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# match uppercase from lowercase
zstyle ':completion:*' matcher-list '' 'm:{a-z-_}={A-Z_-}'

# complete hidden files and directories only when pattern starts with a dot
zstyle ':completion:*:((*-|)files|(*-|)directories)' ignored-patterns '(*/|).[^/]##'

# start menu completion only if it could find no unambiguous initial string
zstyle ':completion:*:correct:*' insert-unambiguous true
zstyle ':completion:*:correct:*' original true

# format for completion
zstyle ':completion:*'             format "%{$fg_bold[green]%}- %d%{$reset_color%}"
zstyle ':completion:*:messages'    format "%{$fg_bold[white]%}- %d%{$reset_color%}"
zstyle ':completion:*:warnings'    format "%{$fg_bold[red]%}- no match for:%{$reset_color%} %d"
zstyle ':completion:*:corrections' format "%{$fg_bold[red]%}%d (errors: %e)%{$reset_color%}"

# separate matches into groups
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*'         group-name ''

# ignore duplicate entries
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' stop yes

# on processes completion complete all user processes
zstyle ':completion:*:processes'       command 'ps -au$USER'

# provide more processes in completion of programs like killall
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'

# ignore internal zsh functions
zstyle ':completion:*:functions' ignored-patterns '_*'

# provide verbose completion information
zstyle ':completion:*' verbose true

# recent (as of Dec 2007) zsh versions are able to provide descriptions
# for commands (read: 1st word in the line) that it will list for the user
# to choose from. The following disables that, because it's not exactly fast.
zstyle ':completion:*:-command-:*:'    verbose false

# complete manual by their section
zstyle ':completion:*:manuals' separate-sections true

# history
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' stop yes

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

zstyle ':completion:*:options' auto-description '%d'
# describe options in full
zstyle ':completion:*:options' description 'yes'



#
# Misc
#

# Open new window in same directory by pressing C-S-T
[[ -n $VTE_VERSION ]] && ifsource /etc/profile.d/vte.sh

# Colors for ls
if command_exists dircolors; then
    [[ -f ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi



#
# Aliases
#
alias -g ...='../..'
alias -g ....='../../..'
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

alias vim='nvim'
alias gap='git add --patch'
alias gst='git status'
alias lsports='ss -tunalp | column -t'



#
# Plugins
#

[[ -d ~/.zplug ]] || git clone --depth 1 https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh

# additional completions
zplug "zsh-users/zsh-completions"

# lean prompt
zplug "miekg/lean"

# fzf binaries
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    use:"*linux*amd64*", \
    as:command, \
    rename-to:"fzf"

zplug "junegunn/fzf", use:"bin/fzf-tmux", as:command

# fzf keybindings and completions
zplug "junegunn/fzf", use:"shell/*.zsh"


# install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# then, source plugins and add commands to $PATH
zplug load
