#
# Custom aliases/settings
#

# any custom stuff should go here.
# ensure that 'custom' exists in the zmodules array in your .zimrc

#
# Shell options
#

# treat lines beginning with '#' as comments
setopt INTERACTIVE_COMMENTS

#
# Evironment variables
#

# fix man colors on rhel based distros when using less
export GROFF_NO_SGR=yes

# go
export GOPATH=${HOME}/go

# node.js
export npm_config_prefix=${HOME}/.node_modules

# prevent wine from adding file associations
export WINEDLLOVERRIDES=winemenubuilder.exe,mscoree,mshtml=


#
# Key bindings
#

# fix gnome-terminal bindings for home and end keys
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line


#
# Aliases
#

alias dmesg='dmesg -exL'
alias ip='ip --stats --color'
alias lsports='ss -tunalp | column -t'

alias vim='nvim'

alias gap='git add --patch'
alias gst='git status'
