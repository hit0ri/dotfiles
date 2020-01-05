# .profile


PATH=$PATH:$HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.node_modules/bin
export PATH

GOPATH=$HOME/go
export GOPATH

npm_config_prefix=$HOME/.node_modules
export npm_config_prefix

EDITOR=nvim
VISUAL=nvim
DIFFPROG='nvim -d'
SUDO_EDITOR=nvim
export EDITOR VISUAL DIFFPROG SUDO_EDITOR

# readline
INPUTRC=$HOME/.inputrc
export INPUTRC

# Default browser
BROWSER=xdg-open
export BROWSER

# Parevent creation of desktop files and file associations for wine applications
WINEDLLOVERRIDES=winemenubuilder.exe,mscoree,mshtml=
export WINEDLLOVERRIDES

# man (less) colors
_esc=$(printf '\e')
PAGER=less
LESS=-RX
LESS_TERMCAP_md="${_esc}[1;31m"
LESS_TERMCAP_mb="${_esc}[1;4;35m"
LESS_TERMCAP_me="${_esc}[0m"
LESS_TERMCAP_so="${_esc}[1;4;33m"
LESS_TERMCAP_se="${_esc}[0m"
LESS_TERMCAP_us="${_esc}[1;4;36m"
LESS_TERMCAP_ue="${_esc}[0m"
GROFF_NO_SGR=yes
export PAGER \
       LESS \
       LESS_TERMCAP_md \
       LESS_TERMCAP_mb \
       LESS_TERMCAP_me \
       LESS_TERMCAP_so \
       LESS_TERMCAP_se \
       LESS_TERMCAP_us \
       LESS_TERMCAP_ue \
       GROFF_NO_SGR
unset _esc

# sar
S_COLORS=auto
export S_COLORS

# libvirt
LIBVIRT_DEFAULT_URI=qemu:///system
export LIBVIRT_DEFAULT_URI

# fzf
if [[ -f /etc/debian_version ]]; then
  _FZF_COMMAND=fdfind
else
  _FZF_COMMAND=fd
fi
FZF_DEFAULT_COMMAND="${_FZF_COMMAND} --type file --follow --hidden --no-ignore-vcs --exclude .git"
FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
FZF_ALT_C_COMMAND="${_FZF_COMMAND} --type directory --follow --hidden --no-ignore-vcs --exclude .git"
export FZF_DEFAULT_COMMAND \
       FZF_CTRL_T_COMMAND \
       FZF_ALT_C_COMMAND

# Terraform
TF_PLUGIN_CACHE_DIR=$HOME/.terraform.d/plugin-cache
export TF_PLUGIN_CACHE_DIR

# Vagrant
VAGRANT_BOX_UPDATE_CHECK_DISABLE=true
VAGRANT_CHECKPOINT_DISABLE=true
VAGRANT_DEFAULT_PROVIDER=libvirt
export VAGRANT_BOX_UPDATE_CHECK_DISABLE \
       VAGRANT_CHECKPOINT_DISABLE \
       VAGRANT_DEFAULT_PROVIDER
