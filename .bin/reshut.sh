#!/bin/bash
option=$1

case option in
  reboot)
    reboot
    ;;
  shutdown)
    shutdown -h now
    ;;
  *)
  echo "Command not found!"
  ;;
esac
