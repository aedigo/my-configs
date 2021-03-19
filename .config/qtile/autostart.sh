#!/bin/bash
redshift &
safeeyes &
nm-applet &
xmodmap ~/.Xmodmap &
nitrogen --restore &
xcape -e "Control_L=Escape" &
flashfocus &

