#!/bin/bash
redshift &
nm-applet &
xmodmap ~/.Xmodmap &
dunst &
nitrogen --restore &
picom --experimental-backend &
conky &
betterlockscreen -u ~/Documents/Wallpapers/road_fog_lights_133408_1366x768.jpg &
xidlehook --not-when-fullscreen --not-when-audio --timer 300 'betterlockscreen -l' '' &
searxStart &

