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

mkdirf() {
  mkdir -p "$1" && cd "$1"
}

# Create paste from stdin or file
pb() {
  curl -sF "c=@${1:--}" 'https://ptpb.pw/'
}

# Create paste from stdin or file and copy url to the clipboard
pbc() {
  curl -sF "c=@${1:--}" \
       -o /dev/stderr \
       -w "%{redirect_url}" 'https://ptpb.pw/?r=1' \
    | xsel -l /dev/null -b
}

# Create expiring paste from stdin or file.
# Default paste lifetime is 30 minutes (1800 seconds)
pbe() {
  curl -sF "c=@${1:--}" -F "sunset=${2:-1800}" 'https://ptpb.pw/'
}

# Create paste from stdin or file (base66 id)
pbp() {
  curl -sF "c=@${1:--}" -F "p=1" 'https://ptpb.pw/'
}

# Create paste from selected text
pbs() {
  xsel -l /dev/null -p -o | curl -sF "c=@-" 'https://ptpb.pw/'
}

# Create paste from ascinema and copy url to the clipboard
pba() {
  local -r recfile=$(mktemp /tmp/term-rec-XXXX.json)

  asciinema rec "${recfile}"

  curl -sF "c=@${recfile}" \
       -o /dev/stderr \
       -w "%{redirect_url}" 'https://ptpb.pw/?r=1' \
    | sed 's|w/|w/t/|' \
    | xsel -l /dev/null -b

  rm "${recfile}"
}

# Generate QR code from stdin or file
qrencode() {
  curl -F "-=${1:-<-}" "https://qrenco.de"
}

twitch() {
  mpv "https://twitch.tv/$1" &> /dev/null &
  disown
}

wttr() {
  curl -s "https://wttr.in/${1}?m"
}
