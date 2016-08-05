typeset -U path
path=(~/bin ~/.local/bin ~/go/bin ~/.node_modules/bin $path[@])

export PAGER=less

# man colors
export LESS=-RX
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'

if type chromium &> /dev/null; then
    export BROWSER=chromium
elif type google-chrome &> /dev/null; then
    export BROWSER=google-chrome
elif type firefox &> /dev/null; then
    export BROWSER=firefox
fi

export EDITOR=nvim
export DIFFPROG='nvim -d'
export SUDO_EDITOR=nvim
export GOPATH=~/go
export npm_config_prefix=~/.node_modules
export WINEDLLOVERRIDES=winemenubuilder.exe,mscoree,mshtml=
export FZF_DEFAULT_OPTS=--inline-info
