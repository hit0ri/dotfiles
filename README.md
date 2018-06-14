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

### bash

Functions:

- curl
- xsel
- asciinema
- mpv

Environment variables:

- ripgrep
- neovim

Aliases:

- neovim

### beets

- ffmpeg (Convert plugin)
- ImageMagick (FetchArt and EmbedArt plugins)

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
- ripgrep

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

- Source Code Pro font

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

- ripgrep
- neovim

Aliases:

- neovim

*Optional:*

- antibody
