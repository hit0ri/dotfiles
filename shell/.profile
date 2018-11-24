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
export ESC=$(printf "\e")
export PAGER=less
export LESS=-RX
export LESS_TERMCAP_md="$ESC[1;31m"
export LESS_TERMCAP_mb="$ESC[1;4;35m"
export LESS_TERMCAP_me="$ESC[0m"
export LESS_TERMCAP_so="$ESC[1;4;33m"
export LESS_TERMCAP_se="$ESC[0m"
export LESS_TERMCAP_us="$ESC[1;4;36m"
export LESS_TERMCAP_ue="$ESC[0m"
export GROFF_NO_SGR=yes

# sar
export S_COLORS=auto

# libvirt
export LIBVIRT_DEFAULT_URI=qemu:///system

# fzf
if [[ -f /etc/debian_version ]]; then
  export FZF_DEFAULT_COMMAND="fdfind --type file --follow --hidden --no-ignore-vcs --exclude .git"
else
  export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --no-ignore-vcs --exclude .git"
fi

FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_T_COMMAND
