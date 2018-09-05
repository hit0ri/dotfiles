# dotfiles

My personal configuration files managed by GNU Stow

> NOTE: etc contains system-wide configurations for X, sysctl, udev, polkit, etc.
> and is **not** managed by `stow`

## Installation

Clone this repository into your `$HOME` directory and use `stow` to install configurations

```bash
git clone --recursive https://github.com/hit0ri/dotfiles.git .dotfiles
cd !$
stow -v zsh mpv
```

## Requirements

### General

- git
- stow
- fzf

### atom

Install packages:

`apm install --packages-file ~/.atom/package.list`

Save list of installed packages:

`apm list --installed --bare | sed 's/@.*$//' > ~/.atom/package.list`

### bash

Functions:

- curl
- xsel
- asciinema
- mpv

Environment variables:

- fd-find
- neovim

Aliases:

- neovim

### beets

- ffmpeg (Convert plugin)
- ImageMagick (FetchArt and EmbedArt plugins)
- python-discogs-client (discogs plugin)

### bspwm

bspwm:

- xsetroot
- xset
- setxkbmap
- feh
- lemonbar

sxhkd:

- termite
- pulseaudio-ctl
- scrot
- thunar
- dmenu

### chromium

Enabled flags:

- `#ignore-gpu-blacklist`
- `#enable-gpu-rasterization`
- `#enable-simple-cache-backend`
- `#enable-tcp-fast-open`
- `#enable-zero-copy`
- `#shared-array-buffer`
- `#enable-native-notifications`

### fontconfig

Fonts:

- Fira Mono
- Source Sans Pro
- Source Serif Pro

### gnome-shell

- Source Code Pro font
- [Arc](https://github.com/horst3180/arc-theme) gtk theme
- [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) icon theme

### i3

- Source Code Pro font
- rofi
- pactl
- scrot
- pcmanfm
- xsetroot
- xset
- setxkbmap
- polybar

### lemonbar

- xtitle
- sutils
- xdo

### mpv

- youtube-dl
- [Fontin](https://www.exljbris.com/fontin.html) and [Fontin Sans CR](https://www.exljbris.com/fontinsans.html) fonts

### neovim

- curl
- go
- fd-find

### polybar

- alsa-lib
- jsoncpp
- i3ipc-glib

Fonts:

- Source Code Pro
- Unifont
- Wuncon Siji

### subl3

- Source Code Pro font

### vscode

- Fira Mono font


Install extensions:

```bash
code --install-extension bungcip.better-toml
code --install-extension christian-kohler.path-intellisense
code --install-extension eamodio.gitlens
code --install-extension kleber-swf.ocean-dark-extended
code --install-extension ms-python.python
code --install-extension PeterJausovec.vscode-docker
code --install-extension PKief.material-icon-theme
code --install-extension vscoss.vscode-ansible
code --install-extension zhuangtongfa.Material-theme
```

List installed extensions:

```bash
code --list-extensions | xargs -L1 echo code --install-extension
```

### xresources

- Source Code Pro font
- Noto fonts
- DejaVu fonts

*Optional:*

- urxvt
- rofi

### zsh

Functions:

- curl
- xsel
- asciinema
- mpv

Environment variables:

- fd-find
- neovim

Aliases:

- neovim

*Optional:*

- antibody
