#!/bin/sh

user_resources=$HOME/.Xresources
user_modmap=$HOME/.Xmodmap

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

if [ -f "$user_resources" ]; then
    xrdb -merge "$user_resources"
fi

if [ -f "$user_modmap" ]; then
    xmodmap "$user_modmap"
fi

if [ -f ~/.xprofile ]; then
    . "$HOME/.xprofile"
fi

sxhkd &
xsetroot -cursor_name left_ptr &
feh --bg-fill "$HOME/Pictures/wallhaven/wallhaven-65287.jpg" &
xset r rate 250 25 &
xset s off &
xset -dpms &
setxkbmap -layout us,ua -option grp:caps_toggle,grp_led:caps &
exec bspwm
