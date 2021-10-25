#!/bin/bash

if [ "$1" == "inc" ]; then
  pulsemixer --change-volume +5
#  amixer -q sset Master 2%+
fi

if [ "$1" == "dec" ]; then
  pulsemixer --change-volume -5
#   amixer -q sset Master 2%-
fi

if [ "$1" == "mute" ]; then
  pulsemixer --toggle-mute
#   amixer -q sset Master toggle
fi

AMIXER=$(amixer sget Master)
# This is another way, but, unfortunelly, did not work for me when using Pipewire 
# VOLUME=$(echo $AMIXER | grep 'Right:' | awk -F'[][]' '{ print $1 }' | tr -d "%")
VOLUME=$(pamixer --get-volume)
echo $VOLUME
MUTE=$(echo $AMIXER | grep -o '\[off\]' | tail -n 1)
if [ "$VOLUME" -le 20 ]; then
    ICON=audio-volume-low
else if [ "$VOLUME" -le 60 ]; then
         ICON=audio-volume-medium
     else 
         ICON=audio-volume-high
     fi
fi
if [ "$MUTE" == "[off]" ]; then
    ICON=audio-volume-muted
fi 



notify-send.py "$VOLUME%" -i /usr/share/icons/Adwaita/32x32/legacy/$ICON.png --replaces-process "volume-popup" -t 1000
