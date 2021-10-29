#!/bin/bash

if [ "$1" == "up" ]; then
  pactl set-sink-volume @DEFAULT_SINK@ +5%
fi

if [ "$1" == "down" ]; then
  pactl set-sink-volume @DEFAULT_SINK@ -5%
fi

if [ "$1" == "mute" ]; then
  pactl set-sink-mute @DEFAULT_SINK@ toggle
fi

VOLUME=$(pactl list sinks | grep '^[[:space:]]Volume:' | \
    head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'
)
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
