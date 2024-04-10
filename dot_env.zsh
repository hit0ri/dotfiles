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

# Catppuccin Frappé
# FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284
#   --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf
#   --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284'

# Catppuccin Mocha
FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
  --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8'

# Catppuccin Macchiato
# FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796
#   --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6
#   --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796'

# Rose-Pine
# FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=fg:#908caa,bg:#191724,hl:#ebbcba
#   --color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
#   --color=border:#403d52,header:#31748f,gutter:#191724
#   --color=spinner:#f6c177,info:#9ccfd8
#   --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa'

# Rose-Pine Moon
# FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# 	--color=fg:#908caa,bg:#232136,hl:#ea9a97
# 	--color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
# 	--color=border:#44415a,header:#3e8fb0,gutter:#232136
# 	--color=spinner:#f6c177,info:#9ccfd8
# 	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa'

export FZF_DEFAULT_OPTS

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
