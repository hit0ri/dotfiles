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
       prompt_subst \
       no_prompt_cr \
       no_prompt_sp

HISTFILE=~/.zhistory
HISTSIZE=8192
SAVEHIST=$HISTSIZE

REPORTTIME=10
WORDCHARS='*?_[]~&;!#$%^(){}<>'



#
# FUNCTIONS
#

[[ -f ~/.functions.sh ]] && . ~/.functions.sh



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


# Disable default venv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

PROMPT='${TMUX:+"%F{yellow}t%f "}'
PROMPT+='%F{magenta}${SSH_TTY:+%m%f }'
PROMPT+='%F{blue}%${prompt_length}<…<%~%<<%f '
PROMPT+='${branch:+"%F{magenta}${branch}%f "}'
PROMPT+='${VIRTUAL_ENV:+"%F{yellow}${VIRTUAL_ENV##*/}%f "}'
PROMPT+='%F{white}%(1j.[%j] .)%f'
PROMPT+='%(?.%F{green}.%F{red})%#%f '

precmd() {
    # Print current directory to the window title
    print -Pn -- '\e]2;%1d\a'

    (( prompt_length = COLUMNS / 2 - 10 ))

    if hash git &> /dev/null; then
        if git rev-parse --is-inside-work-tree &> /dev/null; then
            # Get the current branch name
            branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
        else
            unset repo branch
        fi
    fi
}

preexec() {
    # Print running command to the window title
    print -n  -- '\e]2;'
    print -Pn -- '%* - '
    print -n  -- "$1\a"
}



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
[[ -f ~/.zbundles ]] && . ~/.zbundles

compinit

if [[ -f /usr/share/fzf/shell/key-bindings.zsh ]]; then
    . /usr/share/fzf/shell/key-bindings.zsh
fi

# Colors for ls
[[ -f $HOME/.dircolors ]] && eval "$(dircolors -b $HOME/.dircolors)"
