tar xvfz vimFiles.tgz
rm -f ~/.vimrc
rm -f ~/.bashrc
rm -rf ~/.vim
mv vimrc ~/.vimrc
mv bashrc ~/.bashrc
mv vim ~/.vim;
if [ ! -f ~/.bashprompttag ]; then
  mv prompttag ~/.bashprompttag
fi
