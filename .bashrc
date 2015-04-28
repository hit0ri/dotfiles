# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# Line wrap on window resize
shopt -s checkwinsize

# Git prompt
if [[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh
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

    # Add a bright white exit status for the last command
    # PS1="$White\$? "
    PS1=""
    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $Last_Command == 0 ]]; then
        PS1+="$Green$Checkmark "
    else
        PS1+="$Red$FancyX "
    fi
    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    if [[ $EUID == 0 ]]; then
        PS1+="$Red\\h "
    else
        PS1+="$Green\\u@\\h "
    fi
    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+="$Blue\\w$(__git_ps1) \\\$$Reset "
}
PROMPT_COMMAND='set_prompt'

# Functions
function twitch {
	/usr/bin/livestreamer twitch.tv/$1
}

function sprunge {
    curl -F 'sprunge=<-' http://sprunge.us
}

# Aliases
alias svim='sudo vim'
alias tmux='tmux -2'
alias gap='git add --patch'
alias ports='lsof -i -P -sTCP:LISTEN'
alias dstat='/usr/bin/dstat -cdnpmgs --top-bio --top-cpu'
