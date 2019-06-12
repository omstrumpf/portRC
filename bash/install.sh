#!/bin/sh

cp .profile ~/.profile
cp .bashrc ~/.bashrc
if [ ! -f ~/.bashprompttag ]; then
  cp bash/.bashprompttag ~/.bashprompttag
fi
