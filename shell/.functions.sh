function cdl {
    cd "$1" && ls
}

function cheat.sh {
    curl -s "cheat.sh/$1?style=rrt"
}

function mkdirf {
    mkdir -p "$1" && cd "$1"
}

# Create paste from stdin or file
function pb {
    curl -sF "c=@${1:--}" https://ptpb.pw/
}

# Create paste from stdin or file and copy url to the clipboard
function pbc {
    curl -sF "c=@${1:--}" \
        -w "%{redirect_url}" 'https://ptpb.pw/?r=1' \
        -o /dev/stderr \
        | xsel -l /dev/null -b
}

# Create expiring paste from stdin or file.
# Default paste lifetime is 30 minutes (1800 seconds)
function pbe {
    curl -sF "c=@${1:--}" -F sunset=${2:-1800} https://ptpb.pw/
}

# Create paste from stdin or file (base66 id)
function pbp {
    curl -sF "c=@${1:--}" -F p=1 https://ptpb.pw/
}

# Create paste from selected text
function pbs {
    if hash xsel &> /dev/null; then
        xsel -l /dev/null -p -o | curl -sF c=@- https://ptpb.pw/
    else
        printf "xsel: command not found...\n" 1>&2
    fi
}

# Create paste from ascinema and copy url to the clipboard
function pba {
    if hash asciinema &> /dev/null; then
        local recfile=$(mktemp /tmp/term-rec-XXXX.json)
        asciinema rec "${recfile}"
        curl -sF "c=@${recfile}" \
            -w "%{redirect_url}" 'https://ptpb.pw/?r=1' \
            -o /dev/stderr \
            | sed 's|w/|w/t/|' \
            | xsel -l /dev/null -b
        rm "${recfile}"
    else
        printf "asciinema: command not found...\n" 1>&2
    fi
}

# Generate QR code from stdin or file
function qrencode {
    curl -F "-=${1:-<-}" qrenco.de
}

function twitch {
    mpv "https://twitch.tv/$1" &> /dev/null &
    disown
}

function wttr {
    curl -s "wttr.in/${1}?m"
}
