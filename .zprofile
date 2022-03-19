# If running from tty1 start sway
 if [ "$(tty)" = "/dev/tty1" ]; then
  startx -- -keeptty >~/.xorg.log 2>&1
fi

