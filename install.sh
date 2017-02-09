#!/bin/bash

if [ ! -d "/home/alan/alan-vim" ]; then
    cp ./alan-vim ~/ -r
fi

if [ ! -f "/home/alan/.vimrc" ]; then
    cp ./.vimrc ~/
fi

if [ ! -d "/home/alan/.vim" ]; then
    mkdir ~/.vim
fi

if [ ! -d "/home/alan/.vim/bundle" ]; then
    mkdir ~/.vim/bundle
fi

if [ ! -d "/home/alan/.vim/bundle/Vundle.vim" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ ! -d "/home/alan/.vim/bundle/YouCompleteMe" ]; then
    git clone https://github.com/Valloric/YouCompleteMe.git \
        ~/.vim/bundle/YouCompleteMe
fi

vim +PluginInstall +all
