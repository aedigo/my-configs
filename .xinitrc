#!/bin/sh

# compositor
picom -b &

# keyboard
setxkbmap -layout br nodeadkeys

# audio
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/pipewire-media-session &

# statusbar loop
while true; do
  dwm-bar 
  sleep 1
done &

# wm
exec startdwm
