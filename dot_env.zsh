export GOPATH=~/go

export npm_config_prefix=~/.node_modules

export EDITOR=nvim
export VISUAL=nvim
export DIFFPROG='nvim -d'
export SUDO_EDITOR=nvim

# readline
# export INPUTRC=~/.inputrc

export CLICOLOR=YES

# Default browser
export BROWSER=open

# Parevent creation of desktop files and file associations for wine applications
export WINEDLLOVERRIDES=winemenubuilder.exe,mscoree,mshtml=

# man (less)
export PAGER=less
export LESS='--quit-if-one-screen --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --tabs=4 --no-init'
export GROFF_NO_SGR=yes
export AWS_PAGER=

# sar
export S_COLORS=auto

export LS_COLORS=$(vivid generate one-dark)

# libvirt
# export LIBVIRT_DEFAULT_URI=qemu:///system

# fzf
export _FZF_COMMAND=fd
export FZF_DEFAULT_COMMAND="${_FZF_COMMAND} --type file --follow --hidden --no-ignore-vcs --exclude .git"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND="${_FZF_COMMAND} --type directory --follow --hidden --no-ignore-vcs --exclude .git"

#FZF_DEFAULT_OPTS=${FZF_DEFAULT_OPTS}'
#    --color=fg:#4d4d4c,bg:#eeeeee,hl:#d7005f
#    --color=fg+:#4d4d4c,bg+:#e8e8e8,hl+:#d7005f
#    --color=info:#4271ae,prompt:#8959a8,pointer:#d7005f
#    --color=marker:#4271ae,spinner:#4271ae,header:#4271ae'

# Tokyo Night
# FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# 	--color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7
# 	--color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff
# 	--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff
# 	--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a'
#
# Dracula
# FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
# --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
# --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
# --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
# export FZF_DEFAULT_OPTS

# Terraform
export TF_PLUGIN_CACHE_DIR=~/.terraform.d/plugin-cache

# Vagrant
export VAGRANT_BOX_UPDATE_CHECK_DISABLE=true
export VAGRANT_CHECKPOINT_DISABLE=true
export VAGRANT_DEFAULT_PROVIDER=virtualbox

export AWS_VAULT_BACKEND=pass
export AWS_VAULT_PASS_CMD=gopass
export AWS_VAULT_PASS_PREFIX=aws-vault
export AWS_VAULT_PASS_PASSWORD_STORE_DIR=~/.local/share/gopass/stores/root

export HOMEBREW_NO_ANALYTICS=1

export HOMEBREW_BUNDLE_FILE=~/.brewfile

# HOMEBREW_NO_AUTO_UPDATE=1
# export HOMEBREW_NO_AUTO_UPDATE

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export VOLTA_HOME=~/.volta

export BUILDKIT_PROGRESS=plain
