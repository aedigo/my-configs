case $1 in
  shut)
    shutdown -h now
    ;;
  reboot)
    reboot
    ;;
  *)
esac
