#
# ~/.profile
#

export PATH=$PATH:~/.local/bin:~/go/bin:~/.cargo/bin:~/.node_modules/bin

export GOPATH=~/go
export npm_config_prefix=~/.node_modules


export EDITOR=nvim
export VISUAL=nvim
export DIFFPROG='nvim -d'
export SUDO_EDITOR=nvim

# Default browser
if hash google-chrome &> /dev/null; then
  export BROWSER=google-chrome
elif hash chromium &> /dev/null; then
  export BROWSER=chromium
elif hash firefox &> /dev/null; then
  export BROWSER=firefox
fi

# Parevent creation of desktop files and file associations for wine applications
export WINEDLLOVERRIDES=winemenubuilder.exe,mscoree,mshtml=

# man colors
export PAGER=less
export LESS=-RX
export LESS_TERMCAP_md='\[\e[1;31m\]'
export LESS_TERMCAP_mb='\[\e[1;4;35m\]'
export LESS_TERMCAP_me='\[\e[0m\]'
export LESS_TERMCAP_so='\[\e[1;4;33m\]'
export LESS_TERMCAP_se='\[\e[0m\]'
export LESS_TERMCAP_us='\[\e[1;4;36m\]'
export LESS_TERMCAP_ue='\[\e[0m\]'
export GROFF_NO_SGR=yes

# sar colors
export S_COLORS=auto
