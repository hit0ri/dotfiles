# dotfiles

My personal configuration files managed by GNU Stow

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

## bash

GNU Bourne-Again Shell

### Requirements

Functions:

- curl
- xsel
- asciinema
- mpv

PS1 prompt:

- powerline-go

Environmental variables:

- ripgrep
- neovim

Aliases:

- neovim

## beets

Flexible music library manager and tagger

### Requirements

Convert plugin:

- ffmpeg

Thumbnails plugin:

- imagemagick


## bspwm

Tiling window manager based on binary space partitioning

### Requirements

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

## chromium

A web browser from Google. It is the basis for the proprietary Google Chrome browser.

## cower

a simple AUR downloader

## etc

Contains system-wide configurations for X, sysctl, udev, polkit, etc.

NOTE: Is not managed by `stow`

## fontconfig

A library for configuring and customizing font access

## git

The fast distributed version control system

## gtk

Multi-platform GUI toolkin

### Requirements

- Noto Sans fonts
- [Arc](https://github.com/horst3180/arc-theme) gtk theme
- [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) icon theme

## htop

Interactive ncurses-based process viewer

## i3

An improved dynamic tiling window manager

- Source Code Pro font
- rofi
- pactl
- scrot
- pcmanfm
- xsetroot
- xset
- setxkbmap

## lemonbar

A featherweight, lemon-scented, bar based on xcb

### Requirements

- xtitle
- sutils
- xdo

## mpv

A media player based on MPlayer and mplayer2

### Requirements

Play media directly from youtube, twitch and other websites:

- youtube-dl

Fonts for UI and subs:

- [Fontin](https://www.exljbris.com/fontin.html)
- [Fontin Sans CR](https://www.exljbris.com/fontinsans.html)

## neovim

A text editor based on Vim

### Requirements

- curl
- go
- ripgrep

## npm

A pacakge manager for javascript

## spacemacs

A comunity-driven Emacs distribution

## ssh

OpenSSH SSH client

## subl3

Sophisticated text editor for code, html and prose

### Requirements

- Source Code Pro font

## termite

A simple VTE-based terminal emulator

### Requirements

- vte3-ng

## tmux

A terminal multiplexer

## xinitrc

A shell script read by `xinit` and by its front-end `startx`. It is used to
execute window managers and other proprams when starting the X server.

## xresources

A configuration file used to set [X resources](https://en.wikipedia.org/wiki/X_resources)

### Requirements

- Source Code Pro font
- Noto fonts
- DejaVu fonts

*Optional:*

- urxvt
- rofi

## zshrc

A very advanced and programmable command interpreter (shell) for UNIX

### Requirements

Functions:

- curl
- xsel
- asciinema
- mpv

PS1 prompt:

- powerline-go

Environmental variables:

- ripgrep
- neovim

Aliases:

- neovim

*Optional:*

- antibody

