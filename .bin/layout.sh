#!/bin/bash
usbkdb=`xkb-switch`

function setLayout() {
  setxkbmap "$@"
  xmodmap ~/.Xmodmap
}

if [[ $usbkdb = 'br' ]]
then 
  setLayout br nodeadkeys &
  notify-send.py "nodeadkeys" -t 800
else
  setLayout br &
  notify-send.py "br" -t 800
fi

