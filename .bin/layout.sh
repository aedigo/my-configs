#!/bin/bash
usbkdb=`xkb-switch`

function setLayout() {
  setxkbmap "$@"
  xmodmap ~/.Xmodmap
}

notify() {
  notify-send.py -u low -a 'keyboard-layout' --replaces-process 'key-layout' -i /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-keyboard-shortcuts.png $1 
}

if [[ $usbkdb = 'br' ]]
then 
  setLayout br nodeadkeys &
  notify 'nodeadkeys'
else
  setLayout br &
  notify 'br'
fi

