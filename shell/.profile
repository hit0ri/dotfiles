# .profile


export PATH=$PATH:$HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.node_modules/bin

export GOPATH=$HOME/go
export npm_config_prefix=$HOME/.node_modules

export EDITOR=nvim
export VISUAL=nvim
export DIFFPROG='nvim -d'
export SUDO_EDITOR=nvim

# readline
export INPUTRC=$HOME/.inputrc

# Default browser
export BROWSER=xdg-open

# Parevent creation of desktop files and file associations for wine applications
export WINEDLLOVERRIDES=winemenubuilder.exe,mscoree,mshtml=

# man (less) colors
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
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --no-ignore-vcs --exclude .git'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
