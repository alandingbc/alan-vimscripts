#!/bin/bash

if [ ! -d "/home/alan/alan-vim" ]; then
    echo "copy alan-vim/ ..."
    cp ./alan-vim ~/ -r
fi

if [ ! -f "/home/alan/.vimrc" ]; then
    echo "copy .vimrc ..."
    cp ./.vimrc ~/
fi

if [ ! -d "/home/alan/.vim" ]; then
    echo "copy .vim/ ..."
    mkdir ~/.vim
fi

if [ ! -d "/home/alan/.vim/bundle" ]; then
    mkdir ~/.vim/bundle
fi

if [ ! -d "/home/alan/.vim/bundle/Vundle.vim" ]; then
    echo "git clone Vundle ..."
    while true
    do
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle
        if [ $? == 0 ]; then
            break;
        fi
    done
fi

if [ ! -d "/home/alan/.vim/bundle/YouCompleteMe" ]; then
    echo "git clone YouCompleteMe ..."
    while true
    do
        git clone https://github.com/Valloric/YouCompleteMe.git \
            ~/.vim/bundle/YouCompleteMe
        if [ $? == 0 ]; then
            break;
        fi
    done
fi

vim +PluginInstall +all
