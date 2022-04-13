#!/bin/bash
waybar &
swaybg -c '#282a36' -m fill &
wlsunset -t 3000 &
dunst &
pipewire &
pipewire-pulse &
easyeffects --gapplication-service &
amixer sset 'Master' 100% &
