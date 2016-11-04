rm -rf ~/.vim
rm -rf ~/.tmux
cp vimrc ~/.vimrc
cp bashrc ~/.bashrc
cp -r vim ~/.vim
cp profile ~/.profile
cp -r tmux ~/.tmux
cp tmux.conf ~/.tmux.conf
if [ ! -f ~/.bashprompttag ]; then
  cp prompttag ~/.bashprompttag
fi
