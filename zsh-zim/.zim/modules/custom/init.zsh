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

# allow redirection to existing file
unsetopt NO_CLOBBER

# disable extended globbing
setopt NO_EXTENDED_GLOB


#
# Evironment variables
#

# removed '/' to treat 'foo' and 'bar' as separate words in 'foo/bar'
# removed '=' to treat 'foo' and 'bar' as separate words in 'foo=bar'
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

# fix man colors on rhel based distros when using less
export GROFF_NO_SGR=yes

# go
export GOPATH=${HOME}/go

# node.js
export npm_config_prefix=${HOME}/.node_modules

# prevent wine from adding file associations
export WINEDLLOVERRIDES=winemenubuilder.exe,mscoree,mshtml=

# default text editor
export EDITOR=nvim


#
# Key bindings
#

# search history on up and down keys
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${key_info[Up]}" up-line-or-beginning-search
bindkey "${key_info[Down]}" down-line-or-beginning-search


#
# Aliases
#

alias dmesg='dmesg -exL'
alias ip='ip --color'
alias ips='ip --stats --color'
alias lsports='ss -tunalp | column -t'

alias vim='nvim'

alias gap='git add --patch'
alias gst='git status'


#
# fzf
#
export FZF_DEFAULT_OPTS=--inline-info
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

ifsource /usr/share/fzf/key-bindings.zsh
ifsource /usr/share/fzf/completion.zsh
ifsource ${HOME}/.fzf.zsh

