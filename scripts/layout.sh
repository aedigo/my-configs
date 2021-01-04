#!/bin/bash
usbkdb=`xkb-switch`

function setLayout() {
  setxkbmap $1 $2
  xmodmap ~/.Xmodmap
}

if [[ $usbkdb = 'br' ]]
then 
  setLayout br nodeadkeys
else
  setLayout br
fi


