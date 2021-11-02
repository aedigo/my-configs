#!/bin/bash
# This will define the backgroundcolor
swaybg -c '#282828' -m fill &
safeeyes &
# This will set transparecy on inactive windows
# This will enable night mode
wlsunset -t 3000 -T 8000 -g .8 &
dunst &
whatsapp-nativefier &
