#!/bin/bash
echo "updating git submodules"
git submodule update --init --recursive
ln -s ~/.vim/.vimrc ~/.vimrc
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
