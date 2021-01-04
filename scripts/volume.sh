#! /bin/bash

# Deal with notification
function notifaction() {
# This will give me the status of alsa volume
  volume=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))
  notify-send.sh --replace-file=/tmp/volumenotification "$volume" --expire-time=800
}

# Deal with the volume
function volume() {
  if [[ "$1" = "down" ]]
  then
    amixer -c 0 sset Master 1- unmute
    notifaction
  fi

  if [[ "$1" = "up" ]]
  then
    amixer -c 0 sset Master 1+ unmute
    notifaction
  fi
}

volume "$1"
