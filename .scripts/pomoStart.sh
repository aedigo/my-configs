#!/bin/bash
service="sleep"
if [[ $1 = 'cancel' ]] 
then 
  var=$(pidof $service)
  notify-send.sh --replace-file=/tmp/pomo 'Pomodoro canceled!' --expire-time=600
  kill $var
  exit 1
fi

if pgrep -x "$service" 
then 
  notify-send.sh --replace-file=/tmp/pomo 'Is already running!' --expire-time=600
else 
  aplay ~/Documents/.Musics/sos-morse-code_daniel-simion.wav -d 1 &
  notify-send.sh --replace-file=/tmp/pomo 'Started!' --expire-time=600
  sleep 1200 && zenity --warning --text="Good job! Now take some rest."  &
fi


