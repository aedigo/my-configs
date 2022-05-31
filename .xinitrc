#!/bin/sh

# compositor
picom -b &

# keyboard
setxkbmap -layout br nodeadkeys

# statusbar loop
while true; do
  dwm-bar.sh 
  sleep 1
done &

# wm
bash ~/.dwm/autostart.sh; exec startdwm.sh
