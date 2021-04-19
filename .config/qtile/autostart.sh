#!/bin/bash
nh() {
  nohup "$@" >/dev/null 2>&1& 
}

nh redshift
nh safeeyes 
# I don't need to change or deal with the internet, so there's no need to have the applet
# nm-applet &
nh xmodmap ~/.Xmodmap 
# nitrogen --restore &
nh hsetroot -solid "#1d2021" 
nh xcape -e "Control_L=Escape"
nh flashfocus 
nh picom --experimental-backend 
nh pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo
nh startServer 
nh pcmanfm -d 
nh xfce4-power-manager 
# searxStart &
