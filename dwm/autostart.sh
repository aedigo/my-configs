#!/bin/bash
redshift &
nm-applet &
xmodmap ~/.Xmodmap &
dunst &
nitrogen --restore &
picom --experimental-backend &
conky &
xidlehook --not-when-fullscreen --not-when-audio --timer 300 'i3lock -k --timecolor=FFFFFFCC --time-align 2 -i ~/Documents/Wallpapers/Chevrolet.jpg -t -ef -n' '' &
searxStart &
xcape -d &
xcape -e 'Control_L=Escape' &

