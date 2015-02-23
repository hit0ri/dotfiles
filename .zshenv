typeset -U path
path=(~/bin $path)

export WINEDLLOVERRIDES="winemenubuilder.exe=d"
export BROWSER=google-chrome-stable

#bspwm
PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=24
PANEL_FONT_FAMILY="-*-terminus-medium-r-normal-*-12-*-*-*-c-*-*-1"
export PANEL_FIFO PANEL_HEIGHT PANEL_FONT_FAMILY
