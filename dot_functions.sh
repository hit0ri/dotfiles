# .functions.sh

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
  curl -sF "file=@${1:--}" -A foo 'https://0x0.st'
}

# Generate QR code from stdin or file
qrencode() {
  curl -F "-=${1:-<-}" "https://qrenco.de"
}

wttr() {
  curl -s "https://wttr.in/${1}?m"
}

gi() {
  curl -sLw '\n' "https://www.toptal.com/developers/gitignore/api/$*"
}

b64() {
  echo -n "$1" | base64
}

httping() {
  while :; do
    curl -k --write-out "%{url_effective} - %{response_code} - %{time_total} - $(date +%T)\n" --silent --output /dev/null -L "$1"
    [[ -n $2 ]] && sleep "$2"
  done
}

tls-pin-sha256() {
  openssl s_client -connect "$1:443" </dev/null 2>/dev/null |
    openssl x509 -noout -pubkey |
    openssl pkey -pubin -outform der |
    openssl dgst -sha256 -binary |
    openssl enc -base64
}

awsudo() {
  setopt local_options null_glob
  local cache_files=("$HOME"/.aws/sso/cache/*.json)
  local profile expired=true now

  profile=$(sed -n -E 's/^\[profile (.*)\]/\1/p' ~/.aws/config |
    fzf --query="$1" \
      --select-1 \
      --header="CTRL-X to unset" \
      --bind 'ctrl-x:become(echo unset)')

  [[ -z $profile ]] && return

  unset AWS_PROFILE AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
  [[ $profile == "unset" ]] && return

  export AWS_PROFILE="$profile"

  now=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  if ((${#cache_files[@]} > 0)); then
    for cache_file in "${cache_files[@]}"; do
      if jq -e --arg now "$now" '.expiresAt > $now' "$cache_file" &>/dev/null; then
        expired=false
        break
      fi
    done
  fi

  if $expired && ! aws sts get-caller-identity --profile "$AWS_PROFILE" &>/dev/null; then
    printf 'SSO session expired. Triggering login for profile "%s"...\n' "$AWS_PROFILE"
    aws sso login --profile "$AWS_PROFILE"
  fi

  printf 'AWS_PROFILE: %s\n' "$AWS_PROFILE"
}

ec2-id-from-name() {
  aws ec2 describe-instances \
    --filter "Name=tag:Name,Values=$1" \
    --query "Reservations[].Instances[].InstanceId[]" \
    --output text
  # --query "Reservations[].Instances[?State.Name == 'running'].InstanceId[]" \
}

ssm-connect() {
  if [[ $1 == i-* ]]; then
    local -r id=$1
  else
    local -r id=$(ec2-id-from-name "$1")
  fi
  if [[ ${2:-false} == "ssh" ]]; then
    echo "Connecting to instance $id via ssh"
    ssh "$id"
  else
    echo "Connecting to instance $id"
    aws ssm start-session --target "$id"
  fi
}

ssm-port-forward() {
  if [[ $1 == i-* ]]; then
    local -r id=$1
  else
    local -r id=$(ec2-id-from-name "$1")
  fi
  local remote=$2
  local local=${3:-$remote}
  echo "Forwarding port $remote from instance $id to port $local"
  aws ssm start-session --target "$id" \
    --document-name AWS-StartPortForwardingSession \
    --parameters '{"portNumber":["'"$remote"'"],"localPortNumber":["'"$local"'"]}'
}
