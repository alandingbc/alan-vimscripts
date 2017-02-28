#!/bin/bash

if [ ! -d "/home/alan/alan-vim" ]; then
    echo "copy alan-vim diretory ..."
    cp ./alan-vim ~/ -r
fi

if [ ! -f "/home/alan/.vimrc" ]; then
    echo "copy .vimrc configurated file ..."
    cp ./.vimrc ~/
fi

if [ ! -d "/home/alan/.vim" ]; then
    echo "mkdir .vim directory ..."
    mkdir ~/.vim
fi

if [ ! -d "/home/alan/.vim/bundle" ]; then
    echo "mkdir .vim directory ..."
    mkdir ~/.vim/bundle
fi

if [ ! -d "/home/alan/.vim/bundle/Vundle.vim" ]; then
    echo "Downloading plugin Vundle ..."
    while true
    do
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        if [ $? == 0 ]; then
            echo "git clone Vundle successfully."
            break
        fi
    done
fi

if [ ! -d "/home/alan/.vim/bundle/YouCompleteMe" ]; then
    echo "Downloading plugin YouCompleteMe ..."
    while true
    do
        git clone https://github.com/Valloric/YouCompleteMe.git \
            ~/.vim/bundle/YouCompleteMe
        if [ $? == 0 ]; then
            echo "git clone YouCompleteMe successfully."
            break
        fi
    done
fi

vim +PluginInstall +all
