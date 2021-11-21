#!/bin/bash

dir=$(pwd)

function copy() {
  cp $1 $2 -a
}

function save() {
  cd ~/.my-configs;
  git add .;
  git commit -m 'New Changes!';
  git push -u origin main;
  cd $dir;
}

function delete() {
  rm -rf ~/.my-configs/"$1"
}

case "$1" in
  sway)
    delete .config/sway && copy ~/.config/sway/ ~/.my-configs/.config
    save
    ;;
  trida)
    copy ~/.config/tridactyl/tridactylrc ~/.my-configs/.config
    save
    ;;
  qtile)
    delete .config/qtile && copy ~/.config/qtile ~/.my-configs/.config
    save
    ;;
  nvim)
    delete .config/nvim && copy ~/.config/nvim/configs ~/.my-configs/.config/nvim/ && copy ~/.config/nvim/init.vim ~/.my-configs/.config/nvim/
    save
    ;;
  picom)
    copy ~/.config/picom ~/.my-configs/.config
    save
    ;;
  st)
    copy ~/.config/st ~/.my-configs/.config
    save
    ;;
  mpv)
    copy ~/.config/mpv ~/.my-configs/.config
    save
    ;;
  qutebrowser)
    delete .config/qutebrowser && copy ~/.config/qutebrowser ~/.my-configs/.config
    save
    ;;
  dunst)
    delete .config/dunst && copy ~/.config/dunst ~/.my-configs/.config
    save
    ;;
  rofi)
    copy ~/.config/rofi ~/.my-configs/.config
    save
    ;;
  bin)
    delete .bin && copy ~/.bin ~/.my-configs/
    save
    ;;
  zsh)
    copy ~/.zshrc ~/.my-configs/
    copy ~/.oh-my-zsh/aliases.zsh ~/.my-configs/.oh-my-zsh/
    copy ~/.oh-my-zsh/themes/zhann.zsh-theme ~/.my-configs/.oh-my-zsh/
    save
    ;;
  dual)
    copy ~/.dual-function-keys.yaml ~/.my-configs/
    save
    ;;
  *)
    notify-send 'Not found!'
  ;;
esac



