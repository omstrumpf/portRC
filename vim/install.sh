#!/bin/sh

FANCY=$1
COLOR=$2

cp -R .vim ~/.vim
if [ "$FANCY $COLOR" == "1 1" ]; then
  cp fancyrc-s ~/.vimrc
elif [ "$FANCY $COLOR" == "1 0" ]; then
  cp fancyrc ~/.vimrc
elif [ "$FANCY $COLOR" == "0 1" ]; then
  cp vimrc-s ~/.vimrc
else
  cp vimrc ~/.vimrc
fi
