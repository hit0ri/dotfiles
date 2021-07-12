# .functions.sh


cdl() {
  cd "$1" && ls
}

cheatsh() {
  curl -s "cheat.sh/$1?style=rrt"
}

ipinfo() {
  ip -4 -o a | awk 'BEGIN { OFS=":\t " } { print $2, $4 }'
}

man() {
  LESS_TERMCAP_md=$'\e[1;31m'   \
  LESS_TERMCAP_mb=$'\e[1;4;35m' \
  LESS_TERMCAP_me=$'\e[0m'      \
  LESS_TERMCAP_so=$'\e[1;4;33m' \
  LESS_TERMCAP_se=$'\e[0m'      \
  LESS_TERMCAP_us=$'\e[1;4;36m' \
  LESS_TERMCAP_ue=$'\e[0m'      \
  command man "$@"
}

mkdirf() {
  mkdir -p "$1" && cd "$1"
}

# Create paste from stdin or file
pb() {
  curl -sF "file=@${1:--}" 'https://0x0.st'
}

# Create paste from stdin or file and copy url to the clipboard
pbc() {
  curl -sF "file=@${1:--}" 'https://0x0.st' \
    | xsel -l /dev/null -b
}

# Create paste from selected text
pbs() {
  xsel -l /dev/null -p -o | curl -sF "file=@-" 'https://0x0.st'
}

# Create paste from ascinema and copy url to the clipboard
pba() {
  local -r recfile=$(mktemp /tmp/term-rec-XXXX.json)

  asciinema rec "${recfile}"

  curl -sF "file=@${recfile}" \
       -w "%{redirect_url}" 'https://0x0.st' \
    | xsel -l /dev/null -b

  rm "${recfile}"
}

# Generate QR code from stdin or file
qrencode() {
  curl -F "-=${1:-<-}" "https://qrenco.de"
}

twitch() {
  mpv --no-terminal "https://twitch.tv/$1" &
  disown
}

wttr() {
  curl -s "https://wttr.in/${1}?m"
}
