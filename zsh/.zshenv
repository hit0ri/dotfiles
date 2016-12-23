typeset -U path
path=(~/bin ~/.local/bin ~/go/bin ~/.node_modules/bin ~/.cargo/bin $path[@])

export PAGER=less

# man colors
export LESS=-RX
export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
export LESS_TERMCAP_mb=$(tput bold; tput smul; tput setaf 5)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput smul; tput setaf 3)
export LESS_TERMCAP_se=$(tput sgr0)
export LESS_TERMCAP_us=$(tput bold; tput smul; tput setaf 6)
export LESS_TERMCAP_ue=$(tput sgr0)
export GROFF_NO_SGR=yes

if type chromium &> /dev/null; then
    export BROWSER=chromium
elif type google-chrome &> /dev/null; then
    export BROWSER=google-chrome
elif type firefox &> /dev/null; then
    export BROWSER=firefox
fi

export EDITOR=nvim
export DIFFPROG='nvim -d'
export GOPATH=~/go
export npm_config_prefix=~/.node_modules
export WINEDLLOVERRIDES=winemenubuilder.exe,mscoree,mshtml=
export FZF_DEFAULT_OPTS=--inline-info
