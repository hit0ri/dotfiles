
EDITOR=vim

# Line wrap on window resize
shopt -s checkwinsize

# Colors for ls
eval $(dircolors ~/.dircolors)

# Git prompt
if [[ -f /usr/share/git/completion/git-prompt.sh ]]; then
    . /usr/share/git/completion/git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=true
    export GIT_PS1_SHOWUNTRACKEDFILES=true
fi

# Prompt
set_prompt () {
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
    PS1=""
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
PROMPT_COMMAND='set_prompt'

# Functions
function twitch {
	mpv "http://twitch.tv/$1"
}

function sprunge {
    curl -F 'sprunge=<-' http://sprunge.us
}

function ix {
    curl -F 'f:1=<-' http://ix.io
}

# Aliases
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

alias l='ls -l'
alias la='ls -a'
alias lla='ll -a'

alias vim='subl3'
alias svim='sudo vim'
alias tmux='tmux -2'
alias gap='git add --patch'
alias ports='lsof -i -P -sTCP:LISTEN'
alias dstats='dstat -cdnpmgs --top-bio --top-cpu'