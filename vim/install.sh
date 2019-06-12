#!/bin/sh

FANCY=$1
COLOR=$2

cp -R .vim ~/.vim

cp templaterc /tmp/inrc

if [ "$COLOR" == "1" ]; then
  sed 's/ *"* *<COLOR> *//g' </tmp/inrc >/tmp/outrc
  mv /tmp/outrc /tmp/inrc
else
  sed '/<COLOR>/d' </tmp/inrc >/tmp/outrc
  mv /tmp/outrc /tmp/inrc
fi

if [ "$FANCY" == "1" ]; then
  sed 's/ *"* *<AIRLINE_FANCY> *//g' </tmp/inrc >/tmp/outrc
  mv /tmp/outrc /tmp/inrc
  sed '/<AIRLINE_BASIC>/d' </tmp/inrc >/tmp/outrc
  mv /tmp/outrc /tmp/inrc
else
  sed 's/ *"* *<AIRLINE_BASIC> *//g' </tmp/inrc >/tmp/outrc
  mv /tmp/outrc /tmp/inrc
  sed '/<AIRLINE_FANCY>/d' </tmp/inrc >/tmp/outrc
  mv /tmp/outrc /tmp/inrc
fi

mv /tmp/inrc ~/.vimrc
