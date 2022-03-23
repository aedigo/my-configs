#!/bin/bash
swaybg -c '#282a36' -m fill &
wlsunset -t 3000 &
dunst &
pipewire &
pipewire-pulse &
amixer sset 'Master' 100% &
