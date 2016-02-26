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

if type google-chrome &> /dev/null; then
  export BROWSER=google-chrome
else
  export BROWSER=chromium
fi

export EDITOR=nvim
export SUDO_EDITOR=nvim
export GOPATH=~/go
export npm_config_prefix=~/.node_modules
export WINEDLLOVERRIDES=winemenubuilder.exe,mscoree,mshtml=

# bspwm
export PANEL_FIFO=/tmp/panel-fifo
export PANEL_HEIGHT=24
export PANEL_FONT="Fantasque Sans Mono-12"
export PANEL_WM_NAME=bspwm_panel
