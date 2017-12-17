# dotfiles

My personal configuration files managed by GNU Stow

> NOTE: etc contains system-wide configurations for X, sysctl, udev, polkit, etc.
> and is **not** managed by `stow`

## General requirements

- git
- stow

## Installation

Clone this repository into your `$HOME` directory and use `stow` to install
one or many configurations

```
git clone https://github.com/hit0ri/dotfiles.git .dotfiles
cd !$
stow -v zsh [mpv …]
```

## Individual requirements

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
- chrome://flags/#ignore-gpu-blacklist
- chrome://flags/#enable-gpu-rasterization
- chrome://flags/#enable-simple-cache-backend
- chrome://flags/#enable-tcp-fast-open
- chrome://flags/#enable-zero-copy
- chrome://flags/#shared-array-buffer
- chrome://flags/#enable-native-notifications

### gtk

- Noto Sans fonts
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

### subl3

- Source Code Pro font

### xresources

- Source Code Pro font
- Noto fonts
- DejaVu fonts

*Optional:*

- urxvt
- rofi

### zshrc

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

