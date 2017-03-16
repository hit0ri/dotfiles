#
# ~/.bash_profile
#

#
# Env vars
#

PATH=$PATH:$HOME/bin:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.node_modules/bin
npm_config_prefix=$HOME/.node_modules
export PATH
export npm_config_prefix

export EDITOR=nvim
export DIFFPROG='nvim -d'
export SUDO_EDITOR=$EDITOR

# Default browser
if command -v google-chrome &> /dev/null; then
  export BROWSER=google-chrome
elif command -v chromium &> /dev/null; then
  export BROWSER=chromium
elif command -v firefox &> /dev/null; then
  export BROWSER=firefox
fi

export GOPATH=$HOME/go

# Parevent creation of desktop files and file associations for wine applications
export WINEDLLOVERRIDES=winemenubuilder.exe,mscoree,mshtml=

# Man colors
export PAGER=less
export LESS=-RX
LESS_TERMCAP_md=$(tput bold; tput setaf 1)
LESS_TERMCAP_mb=$(tput bold; tput smul; tput setaf 5)
LESS_TERMCAP_me=$(tput sgr0)
LESS_TERMCAP_so=$(tput bold; tput smul; tput setaf 3)
LESS_TERMCAP_se=$(tput sgr0)
LESS_TERMCAP_us=$(tput bold; tput smul; tput setaf 6)
LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_md LESS_TERMCAP_mb LESS_TERMCAP_me LESS_TERMCAP_so \
       LESS_TERMCAP_se LESS_TERMCAP_us LESS_TERMCAP_ue
export GROFF_NO_SGR=yes

[[ -f ~/.bashrc ]] && . ~/.bashrc
