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

- Arimo
- Caladea
- Hack

### gnome-shell

- Arc gtk theme
- Paper icon theme

### i3

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

- Unifont
- Wuncon Siji

### vscode

Install extensions:

```bash
code --install-extension bungcip.better-toml
code --install-extension christian-kohler.path-intellisense
code --install-extension eamodio.gitlens
code --install-extension ms-python.python
code --install-extension PeterJausovec.vscode-docker
code --install-extension vscoss.vscode-ansible
code --install-extension dracula-theme.theme-dracula
code --install-extension PKief.material-icon-theme
```

List installed extensions:

```bash
code --list-extensions | xargs -L1 echo code --install-extension
```

### xresources

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
