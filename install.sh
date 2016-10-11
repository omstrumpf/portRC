rm -f ~/.vimrc
rm -f ~/.bashrc
rm -rf ~/.vim
cp vimrc ~/.vimrc
cp bashrc ~/.bashrc
cp -r vim ~/.vim
cp profile ~/.profile
if [ ! -f ~/.bashprompttag ]; then
  cp prompttag ~/.bashprompttag
fi
