include() {
    [[ -f "$1" ]] && source "$1"
}

# Source global definitions
include /etc/bashrc

export EDITOR=nvim
export BROWSER=google-chrome
export SUDO_EDITOR=nvim
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
# eval $(dircolors ~/.dircolors)

# Git prompt
include /usr/share/git-core/contrib/completion/git-prompt.sh || \
    include /usr/share/git/completion/git-prompt.sh \
    && export GIT_PS1_SHOWDIRTYSTATE=true \
    && export GIT_PS1_SHOWUNTRACKEDFILES=true

# Prompt
set_prompt() {
    Last_Command=$? # Must come first!
    Blue='\[\e[01;34m\]'
    White='\[\e[01;37m\]'
    Red='\[\e[01;31m\]'
    Green='\[\e[01;32m\]'
    Reset='\[\e[00m\]'
    FancyX='\342\234\227'
    Checkmark='\342\234\223'
    Cloud='\342\230\201'
    Skull='\342\230\240'
    WarningSign='\342\232\240'
    HighVoltage='\342\232\241'

    # Add a bright white exit status for the last command
    # PS1="$White\$? "
    PS1=''
    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $Last_Command == 0 ]]; then
        PS1+="$Green$Cloud  "
    else
        PS1+="$Red$Cloud  "
    fi
    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    # if [[ $EUID == 0 ]]; then
    #     PS1+="$Red\\h "
    # else
    #     PS1+="$Green\\u@\\h "
    # fi
    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+="$Blue\\w$(__git_ps1) \\\$$Reset "
}
PROMPT_COMMAND=set_prompt

# Functions
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

cdl() {
    cd "$1" && ls
}

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
alias grep='grep --color=auto'

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

