#!/bin/bash

dir=$(pwd)
path=~/.my-configs
home=/home/aedigo

copy() {
  echo $1 $2
  cp $1 $2 -a
}

delete() {
  rm -rf "$@" 
}

save() {
  cd $path
  if [[ $3 = 'cg' ]] 
  then
    delete $path/$2/$1
    copy $home/.config/$1 $path/$2
  else 
    delete $path/$1
    copy $home/$1 $path/$2
  fi
  git add . ;
  git commit -m 'new changes!';
  git push -u origin main;
  cd $dir
}

save "$@"

