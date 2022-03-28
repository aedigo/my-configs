# If running from tty1 start sway
[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null) ]]

