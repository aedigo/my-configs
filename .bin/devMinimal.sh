#!/bin/bash

# It could be better if I could especify a directory where I want this script to be started.

dir() {
  mkdir -p $1
}
dir sass/partials
dir public/css

files() {
  if [[ $1 = 'partials' ]]
  then
    touch sass/partials/_$2.scss
  else
    touch sass/$2.scss
  fi
}

files 'partials' 'base'
files 'partials' 'layout'
files 'partials' 'components'
files '' 'main'

write() {
  echo $1 >> sass/main.scss
}

write '@use "partials/base"'
write '@use "partials/layout"'
write '@use "partials/components"'


