[[ -r ~/.profile ]] && . ~/.profile

typeset -U path
path=(~/.local/bin ~/go/bin ~/.cargo/bin ~/.node_modules/bin $path[@])
