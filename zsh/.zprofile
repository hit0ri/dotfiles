typeset -U path
path=(~/.local/bin ~/go/bin ~/.cargo/bin ~/.node_modules/bin $path[@])

export GOPATH=~/go
export npm_config_prefix=~/.node_modules

export EDITOR=nvim
export VISUAL=nvim
export DIFFPROG='nvim -d'
export SUDO_EDITOR=nvim

export BROWSER=xdg-open

export WINEDLLOVERRIDES=winemenubuilder.exe,mscoree,mshtml=

# man (less)
export PAGER=less
export LESS=-RX
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_mb=$'\e[1;4;35m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;4;33m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;36m'
export LESS_TERMCAP_ue=$'\e[0m'
export GROFF_NO_SGR=yes

# sar
export S_COLORS=auto

# libvirt
export LIBVIRT_DEFAULT_URI=qemu:///system

# fzf
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden --smart-case --no-ignore --glob "!.git/*" --glob "!node_modules/*"'
