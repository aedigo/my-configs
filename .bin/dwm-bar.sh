#!/bin/bash
normal="^c#f8f8f2^"
normal_men="^c#50fa7b^"
normal_cpu="^c#8be9fd^"
normal_root="^c#ffb86c^"
normal_home="^c#bd93f9^"
normal_date="^c#ff79c6^"
urgent="^c#ff5555^"
alarming="^c#f1fa8c"

volume=$(pamixer --get-volume)
root=$(df -h | awk '{ if ($6 == "/") print $4 }')
root_int=${root::-1}
home=$(df -h | awk '{ if ($6 == "/home") print $4 }')
freemen_per=$(free -m | awk 'NR==2{print $3*100/$2 }')
freemen_per_int=$(printf "%.0f\n" "$freemen_per")
date=$(date +"%m/%d %H:%M")
cpu=$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1) "%"; }' \
<(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat))
cpu_per_int=$(printf "%.0f\n" "$cpu")

status=""

if [[ $volume -ge 40 ]]; then
  status+="  $urgent$volume% "
elif [[ $volume -le 10 ]]; then
  status+="  $urgent$volume% "
else
  status+="  $normal$volume% "
fi

if [[ $cpu_per_int -ge 80 ]]; then
  status+="$urgent$cpu_per_int% "
else
  status+="$normal_cpu$cpu_per_int% "
fi

if [[ $freemen_per_int -ge 70 ]]; then
  status+="$urgent$freemen_per_int% "
elif [[ $freemen_per_int -ge 60 ]]; then
  status+="$alarming$freemen_per_int% "
else
  status+="$normal_men$freemen_per_int% "
fi

if [[ $root_int -le 10 ]]; then
  status+="$alarming$root_int% "
elif [[ $root_int -le 7 ]]; then 
  status+="$urgent$root_int% "
else
  status+="$normal_root$root_int% "
fi

status+="$normal_home$home "
status+="$normal_date$date "
xsetroot -name "$status "
