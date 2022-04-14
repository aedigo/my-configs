#!/bin/bash
swaybg -c '#282a36' -m fill &
wlsunset -T 5000 &
dunst &
pipewire &
pipewire-pulse &
easyeffects --gapplication-service &
amixer sset 'Master' 100% &
