#!/bin/bash
while true; do
    # Log stderror to a file 
    dwl 2> ~/.dwl.log
    # No error logging
    #dwm >/dev/null 2>&1
done
