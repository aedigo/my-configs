#!/bin/bash
source "`ueberzug library`"

[ -z "$5" ] && echo "Usage: $0 <image> <x> <y> <height> <width>" && exit

ImageLayer 0< <(
  ImageLayer::add [identifier]="example0" [x]="$2" [y]="$3" [height]="$5" [width]="$4" [path]="$1"
  read
)
