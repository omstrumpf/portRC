if [ $# -eq 0 ]; then
    echo "Usage: ./install.sh [-v [-f] [-c]] [-b] [-t]"
    echo "       -v: install vim settings"
    echo "		    -f: fancy graphics (requires fancy fonts - disable if statusline looks awful)"
    echo "          -c: install solarized color scheme"
    echo "       -b: install bash and profile settings"
    echo "       -t: install tmux settings"
    exit
fi

VIMRC=0
COLOR=0
FANCY=0

for arg in "$@"
do
    if [ "$arg" == "-b" ]; then
        cp profile ~/.profile
        cp bashrc ~/.bashrc
        if [ ! -f ~/.bashprompttag ]; then
            cp prompttag ~/.bashprompttag
        fi
    elif [ "$arg" == "-t" ]; then
        cp tmux.conf ~/.tmux.conf
    elif [ "$arg" == "-v" ]; then
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
        cp fancyrc-s ~/.vimrc
    elif [ "$FANCY $COLOR" == "1 0" ]; then
        cp fancyrc ~/.vimrc
    elif [ "$FANCY $COLOR" == "0 1" ]; then
        cp vimrc-s ~/.vimrc
    else
        cp vimrc ~/.vimrc
    fi
fi

