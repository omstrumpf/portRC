tar xvfz vimFiles.tgz
rm -f ~/.vimrc
rm -f ~/.bashrc
rm -rf ~/.vim
mv vimrc ~/.vimrc
mv bashrc ~/.bashrc
mv vim ~/.vim;
mv prompttag ~/.bashprompttag
source ~/.bashrc
