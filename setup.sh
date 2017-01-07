#!/bin/bash
ln -s ~/.vim/.vimrc ~/.vimrc
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
vim +PlugInstall +qall
