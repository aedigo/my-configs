#!/bin/bash

dir=$(pwd)
path=~/.my-configs
home=/home/aedigo

copy() {
  echo $1 $2
  cp $1 $2 -a
}

save() {
  cd $path
  delete $path/$2
  if [[ $3 = 'cg' ]] 
  then
    copy $home/.config/$1 $path/$2
  else 
    copy $home/$1 $path/$2
  fi
  git add . ;
  git commit -m 'new changes!';
  git push -u origin main;
  cd $dir
}

delete() {
  rm -rf ~/.my-configs/"$1"
}

save "$@"

