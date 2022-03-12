#!/bin/sh

hsetroot -solid '#282a36' &
xrandr --output VGA-1 --gamma 1.0:0.88:0.76 --brightness 0.85 &
alsactl --file ~/.config/asound.state restore &
xmodmap ~/.Xmodmap &
unclutter &
jamesdsp -t &
run_xidlehook &
safeeyes &
