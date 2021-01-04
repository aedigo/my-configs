#!/bin/bash
service="sleep"
if [[ $1 = 'cancel' ]] 
then 
  var=$(pidof $service)
  notify-send "Pomodoro canceled!"
  kill $var
  exit 1
fi

if pgrep -x "$service" 
then 
  notify-send "Is already running!"
else 
  aplay ~/Documents/.Musics/sos-morse-code_daniel-simion.wav -d 1 &
  notify-send "Started!" &
  sleep 1200 && zenity --warning --text="Good job! Now take some rest."  &
fi


