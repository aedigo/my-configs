#!/bin/bash

# It could be better if I could especify a directory where I want this script to be started.

dir() {
  mkdir -p $1
}
dir src/sass/partials
dir public/css

file() {
  if [[ $1 = 'partials' ]]
  then
    touch src/sass/partials/_$2.scss
  else
    touch src/sass/$2.scss
  fi
}

file 'partials' 'base'
file 'partials' 'layout'
file 'partials' 'components'
file '' 'main'

write() {
  echo $1 >> src/sass/main.scss
}

write '@use "partials/base";'
write '@use "partials/layout";'
write '@use "partials/components";'


