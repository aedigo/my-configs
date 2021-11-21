#!/bin/bash
redshift -P -O 3000 &
safeeyes &
setxkbmap -layout br nodeadkeys &
xmodmap ~/.Xmodmap &
hsetroot -solid "#282a36" &
picom &
emacs --daemon &
#startServer &
xfce4-power-manager &
whatsapp-nativefier &
