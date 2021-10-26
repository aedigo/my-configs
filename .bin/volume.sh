#!/bin/bash

if [ "$1" == "inc" ]; then
  pamixer --allow-boost -i 5 
fi

if [ "$1" == "dec" ]; then
  pamixer --allow-boost -d 5 
fi

if [ "$1" == "mute" ]; then
  pamixer -m
fi

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

notify-send.py --replaces-process "volume-popup" -u low -a 'volume' $VOLUME% -i /usr/share/icons/Adwaita/32x32/legacy/$ICON.png
