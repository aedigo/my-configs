#!/bin/bash
usbkdb=`xkb-switch`
if [[ $usbkdb = 'br' ]]
then 
  setxkbmap br nodeadkeys
  xmodmap ~/.Xmodmap
else
  setxkbmap br
  xmodmap ~/.Xmodmap
fi


