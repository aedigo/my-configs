#!/bin/bash
# This will define the backgroundcolor
swaybg -c '#282828' -m fill &
safeeyes &
# This will set transparecy on inactive windows
inactive_trans -o .4 &
# This will enable night mode
wlsunset -t 3000 -T 8000 -g .8 &
# This will autostart searx
searxStart &
dunst &
whatsapp-nativefier &
main-layout &

