export KEYTIMEOUT=10
export WORDCHARS='*?_[]~=&;!#$%^(){}'

# Report CPU usage for commands running longer than 10 seconds
REPORTTIME=10

# History
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=3000


# Functions
include() {
    [[ -f "$1" ]] && source "$1"
}

twitch() {
    mpv "http://twitch.tv/$1"
}

ssh_state() {
    if [[ -n "$SSH_CLIENT" || -n "$SSH_CONNECTION" || -n "$SSH_TTY" ]]; then
        print "%{$fg_bold[cyan]%}<%{$reset_color%}%{$fg_bold[white]%}%m%{$fg_bold[cyan]%}>%{$reset_color%} "
    fi
}

cdl() {
    cd "$1" && ls
}

mkdirf() {
    mkdir -p "$1" && cd "$1"
}

pb() {
    curl -F "c=@${1:--}" https://ptpb.pw/
}

pbp() {
    curl -F p=1 -F "c=@${1:--}" https://ptpb.pw/
}

pbx() {
    curl -sF "c=@${1:--}" -w "%{redirect_url}" 'https://ptpb.pw/?r=1' -o /dev/stderr | xsel -l /dev/null -b
}

pbs() {
    scrot /tmp/$$.png && pbx /tmp/$$.png && rm /tmp/$$.png
}


# Open new window in same directory by pressing C-S-T
if [[ -n $VTE_VERSION ]]; then
    include /etc/profile.d/vte.sh
fi

# Syntax highlighting (must be at the end of the .zshrc)
include /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Git prompt
include /usr/share/git-core/contrib/completion/git-prompt.sh
include /usr/share/git/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"


setopt share_history \
       extended_history \
       hist_ignore_dups \
       hist_reduce_blanks \
       hist_fcntl_lock \
       hist_ignore_space \

# Options
setopt auto_cd \
       pushd_silent \
       complete_aliases \
       glob_dots \
       interactive_comments \
       # extended_glob


# Help
autoload -U run-help
autoload run-help-git
alias help='run-help'

# Key bindings
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


# Prompt
autoload -Uz promptinit
promptinit
autoload -Uz colors
colors
setopt prompt_subst

PROMPT='$(ssh_state)%{$fg_bold[red]%}>%{$fg_bold[yellow]%}>%{$fg_bold[green]%}>%{$reset_color%} '
RPROMPT='%{$fg_bold[magenta]%}$(__git_ps1 %s)%{$reset_color%} %{$fg_bold[blue]%}%~%{$reset_color%}'


# Colors for ls
if type dircolors &>/dev/null; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi


# Completion
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

# match uppercase from lowercase and enable partial word completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# zstyle ':completion:*:((*-|)files|(*-|)directories)' ignored-patterns '(*/|).[^/]##'

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


# Aliases
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
alias  ls='ls --color=auto --show-control-chars --group-directories-first -hXF'
alias  ll='ls --color=auto --show-control-chars --group-directories-first -lhXF'
alias lsa='ls --color=auto --show-control-chars --group-directories-first -AhXF'
alias lla='ls --color=auto --show-control-chars --group-directories-first -AlhXF'
alias dmesg='dmesg -exL'
alias ip='ip --stats --color'

alias vim='nvim'
alias svim='sudoedit'
alias dstats='dstat -cdnpmgs --top-bio --top-cpu'
alias lsports='ss -tunalp | cat'
