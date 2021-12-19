#!/bin/bash
root=$(df -h | awk '{ if ($6 == "/") print $4 }')
home=$(df -h | awk '{ if ($6 == "/home") print $4 }')
freemen=$(free -h | awk '(NR==2){ print $3 }')
date=$(date +"%m/%d %H:%M")
xsetroot -name "$freemen $root $home $date"
