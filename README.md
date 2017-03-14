dotfiles
========

This repository contains my personal configuration files managed by GNU Stow


## Requirements
- git
- stow
- curl


## Installation
`stow -v zsh [mpv]...`

### neovim
```sh
curl --create-dirs -fLo $HOME/.config/nvim/autoload/plug.vim \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
  && stow -v neovim \
  && nvim +PlugInstall +qa
```
