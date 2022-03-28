#!/bin/bash

dir=$(pwd)
path=~/.my-configs

copy() {
  echo $1 $2
  cp $1 $2 -a
}

save() {
  cd $path
  delete $path/$2
  copy $1 $path/$2
  git add . ;
  git commit -m 'new changes!';
  git push -u origin main;
  cd $dir
}

delete() {
  rm -rf ~/.my-configs/"$1"
}

save $1 $2

