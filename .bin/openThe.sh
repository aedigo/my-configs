#!/bin/bash
terminal="st -e"
editor="nvim"
name="$1"

case $name in 

# All of this is for openning softwares.

nnn)
  $terminal nnn 
  ;;

vimiv)
  $terminal vimiv ~/Documents
  ;;

vimwiki)
  $terminal $editor ~/.vimwki/index.wiki 
  ;;

# This will be trigger if none of the ones before are true. Basically, it 's the default message.
*)
  echo "$name does not exist."
  ;;
esac

