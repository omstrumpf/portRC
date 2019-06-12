if [ $# -eq 0 ]; then
    echo "Usage: ./install.sh [-v [-f] [-c]] [-b] [-t]"
    echo "       -v: install vim settings"
    echo "		    -f: fancy graphics (requires fancy fonts - disable if statusline looks awful)"
    echo "          -c: install solarized color scheme"
    echo "       -b: install bash and profile settings"
    echo "       -t: install tmux settings"
    echo "       -g: install git config"
    exit
fi

VIMRC=0
COLOR=0
FANCY=0

for arg in "$@"
do
    if [ "$arg" == "-b" ]; then
        cp bash/.profile ~/.profile
        cp bash/.bashrc ~/.bashrc
        if [ ! -f ~/.bashprompttag ]; then
            cp bash/.bashprompttag ~/.bashprompttag
        fi
    elif [ "$arg" == "-t" ]; then
        cp tmux/tmux.conf ~/.tmux.conf
    elif [ "$arg" == "-g" ]; then
        cp git/.gitconfig ~/.gitconfig
    elif [ "$arg" == "-v" ]; then
        cp -R vim/.vim ~/.vim
        VIMRC=1
    elif [ "$arg" == "-f" ]; then
        FANCY=1
    elif [ "$arg" == "-c" ]; then
        COLOR=1
    else
        echo "unknown argument $arg"
    fi
done

if [ "$VIMRC" == "1" ]; then
    if [ "$FANCY $COLOR" == "1 1" ]; then
        cp vim/fancyrc-s ~/.vimrc
    elif [ "$FANCY $COLOR" == "1 0" ]; then
        cp vim/fancyrc ~/.vimrc
    elif [ "$FANCY $COLOR" == "0 1" ]; then
        cp vim/vimrc-s ~/.vimrc
    else
        cp vim/vimrc ~/.vimrc
    fi
fi

