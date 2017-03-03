typeset -U path
path=(~/bin ~/.local/bin ~/go/bin ~/.node_modules/bin ~/.cargo/bin $path[@])


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
export FZF_DEFAULT_COMMAND='rg --files --smart-case --no-ignore --hidden --glob "!.git/*"'
