#!/bin/bash
volume="\x01| "$(pamixer --get-volume)'%'
root=$(df -h | awk '{ if ($6 == "/") print $4 }')
home=$(df -h | awk '{ if ($6 == "/home") print $4 }')
freemen=$(free -h | awk '(NR==2){ print $3 }')
date=$(date +"%m/%d %H:%M")
cpu=$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1) "%"; }' \
<(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat))

status=""
if [$batperc -le 10]; then
	# use "warning" color
	status+="\x03 BAT: $batperc"
elif [$batperc -le 5]; then
	# use "error" color
	status+="\x04 BAT: $batperc"
else
	# default is normal color
	status+="BAT: $batperc"
fi

# switch back to normal color for date
status+="\x01| "+$(date)

echo -e $status

