#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: ./install.sh [-v [-f] [-c]] [-b] [-t] [-g]"
  echo "       -v: install vim settings"
  echo "         -f: fancy graphics (requires fancy fonts - disable if statusline looks awful)"
  echo "         -c: install solarized color scheme"
  echo "       -b: install bashrc and profile settings"
  echo "       -t: install tmux settings"
  echo "       -g: install git config"
  exit
fi

VIMRC=0
VIM_COLOR=0
VIM_FANCY=0

for arg in "$@"
do
  if [ "$arg" == "-b" ]; then
    cd bash ; ./install.sh ; cd ..
  elif [ "$arg" == "-t" ]; then
    cd tmux ; ./install.sh ; cd ..
  elif [ "$arg" == "-g" ]; then
    cd git ; ./install.sh ; cd ..
  elif [ "$arg" == "-v" ]; then
    VIMRC=1
  elif [ "$arg" == "-f" ]; then
    VIM_FANCY=1
  elif [ "$arg" == "-c" ]; then
    VIM_COLOR=1
  else
    echo "unknown argument $arg"
  fi
done

if [ "$VIMRC" == "1" ]; then
  cd vim ; ./install.sh $FANCY $COLOR ; cd ..
fi

