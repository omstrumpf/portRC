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
        VIMRC=$(( $VIMRC + 1))
        rm -rf ~/.vim
        cp -r vim ~/.vim
        if [ $VIMRC -eq 1 ]; then
            cp vimrc ~/.vimrc
        fi
        if [ $VIMRC -eq 11 ]; then
            cp vimrc-s ~/.vimrc
        fi
    elif [ "$arg" == "-f" ]; then
        VIMRC=$(( $VIMRC + 2 ))
        if [ $VIMRC -eq 2 ]; then
            cp fancyrc ~/.vimrc
        elif [ $VIMRC -eq 12 ]; then
            cp fancyrc-s ~/.vimrc
        fi
    elif [ "$arg" == "-c" ]; then
        VIMRC=$(( $VIMRC + 10 ))
        if [ $VIMRC -eq 11 ]; then
            cp vimrc-s ~/.vimrc
        elif [ $VIMRC -eq 12 ]; then
            cp fancyrc-s ~/.vimrc
        fi
    else
        echo "unknown argument $arg"
    fi
done
