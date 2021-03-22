#!/bin/bash
redshift &
safeeyes &
nm-applet &
xmodmap ~/.Xmodmap &
nitrogen --restore &
xcape -e "Control_L=Escape" &
flashfocus &
picom --experimental-backend &
pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo &
startServer &
