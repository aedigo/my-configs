if [ $1 == 'both' ]; then
  swayidle -w \
    timeout $2 'swaylock -f -c 282828' \ 
    before-sleep 'safeeyes -d' \
    timeout $3 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on safeeyes -e"' \
fi

if [ $1 == 'safeeyes' ]; then
  swayidle -w timeout 100 'safeeyes -d' resume 'safeeyes -e' 
fi

if [ $1 == 'hibernate' ]; then
  swayidle -w \
    timeout 1800 'systemctl hibernate' \
fi
