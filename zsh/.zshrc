typeset -U path
path=(~/go/bin ~/bin $path)

export KEYTIMEOUT=10
export WORDCHARS='*?_[]~=&;!#$%^(){}'

# History
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=3000
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


# Completion
autoload -Uz compinit
compinit
# rehash executables in PATH
zstyle ':completion:*' rehash true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:corrections' fformat $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:((*-|)files|(*-|)directories)' ignored-patterns '(*/|).[^/]##'
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*:man:*' menu yes select
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
zstyle ':completion:*:-command-:*:' verbose false
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' stop yes


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
# alt arrow [left,right]
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word
# ctrl arrow [left,right]
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
# arrow [up,down]
bindkey '^[[A'    up-line-or-beginning-search
bindkey '^[[B'    down-line-or-beginning-search
# home
bindkey '^[[H'    beginning-of-line
# end
bindkey '^[[F'    end-of-line

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


# Aliases
alias -g ...='../..'
alias -g ....='../../..'
alias rm='rm -vI'
alias cp='cp -vi'
alias mv='mv -vi'
alias ln='ln -vi'
alias mkdir='mkdir -vp'

alias chmod='chmod -c --preserve-root'
alias chown='chown -c --preserve-root'
alias chgrp='chgrp -c --preserve-root'

alias grep='grep --color=auto'
alias ls='ls --color=auto --show-control-chars --group-directories-first -hXF'
alias ll='ls --color=auto --show-control-chars --group-directories-first -lhXF'
alias lsa='ls --color=auto --show-control-chars --group-directories-first -AhXF'
alias lla='ls --color=auto --show-control-chars --group-directories-first -AlhXF'
alias dmesg='dmesg -exL'

alias svim='sudo vim'
alias dstats='dstat -cdnpmgs --top-bio --top-cpu'

# bins
alias i='curl -F "f:1=<-" ix.io'
alias s='curl -F "sprunge=<-" sprunge.us'
alias p='curl -F "c=@-" https://ptpb.pw'
# upload highlighted text
alias xc='xclip -o | i'


# Functions
twitch() { mpv "http://twitch.tv/$1" }

# Prompt
autoload -Uz promptinit
promptinit
autoload -Uz colors
colors
setopt prompt_subst

for f in /usr/share/zsh/site-contrib/powerline.zsh \
         /usr/share/powerline/zsh/powerline.zsh \
         /usr/share/powerline/bindings/zsh/powerline.zsh; do
    [[ -f "$f" ]] && source "$f"
done

# source /usr/share/git/git-prompt.sh
# export RPROMPT='$(__git_ps1)'
# PROMPT="%{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m%{$reset_color%} %{$fg[yellow]%}%~%{$reset_color%}%  "
# prompt redhat

# Colors for ls
if [[ ! -f ~/.dircolors ]]; then
    dircolors -p > ~/.dircolors
fi
eval $(dircolors ~/.dircolors)


# Open new window in same directory by pressing C-S-T
# if [[ -n $VTE_VERSION ]]; then
#     source /etc/profile.d/vte.sh
#     __vte_prompt_command
# fi


# Syntax highlighting (must be at the end of the .zshrc)
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
