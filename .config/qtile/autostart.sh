#!/bin/sh

hsetroot -solid '#282a36' &
xrandr --output VGA-1 --gamma 1.0:0.88:0.60 --brightness 0.95 &
easyeffects --gapplication-service &
dunst &
xmodmap ~/.Xmodmap &
unclutter &
run_xidlehook &
safeeyes &
alacritty &
