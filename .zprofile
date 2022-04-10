# If running from tty1 start sway
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx -- -keeptty >~/.xorg.log 2>&1
fi

