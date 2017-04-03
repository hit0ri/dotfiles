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
if command -v google-chrome &> /dev/null; then
  export BROWSER=google-chrome
elif command -v chromium &> /dev/null; then
  export BROWSER=chromium
elif command -v firefox &> /dev/null; then
  export BROWSER=firefox
fi

# Parevent creation of desktop files and file associations for wine applications
export WINEDLLOVERRIDES=winemenubuilder.exe,mscoree,mshtml=

# Man colors
export PAGER=less
export LESS=-RX
export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
export LESS_TERMCAP_mb=$(tput bold; tput smul; tput setaf 5)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput smul; tput setaf 3)
export LESS_TERMCAP_se=$(tput sgr0)
export LESS_TERMCAP_us=$(tput bold; tput smul; tput setaf 6)
export LESS_TERMCAP_ue=$(tput sgr0)
export GROFF_NO_SGR=yes

# sar colors
export S_COLORS=auto
