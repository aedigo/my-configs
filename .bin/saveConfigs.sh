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
  xinitrc)
    delete .config/xinitrc; copy ~/.xinitrc ~/.my-configs/
    save
    ;;
  sway)
    delete .config/sway && copy ~/.config/sway/ ~/.my-configs/.config
    save
    ;;
  fish)
    delete .config/fish; copy ~/.config/fish/ ~/.my-configs/.config
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
    delete .config/nvim; copy ~/.config/nvim ~/.my-configs/.config/
    save
    ;;
  picom)
    copy ~/.config/picom ~/.my-configs/.config
    save
    ;;
  st)
    delete .st; copy ~/.st ~/.my-configs/
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



