#!/bin/sh

echo "> Symlinking .vimrc"
if [ -e $HOME/.vimrc ]; then
    echo "> Backing up existing .vimrc file"
    mv $HOME/.vimrc $HOME/.vimrc.$(date +%Y%m%d_%H%M%S).bak
fi
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc

if [ -d $HOME/.vim ]; then
    echo "> Backing up existing .vim directory"
    mv $HOME/.vim $HOME/.vim.$(date +%Y%m%d_%H%M%S).bak
fi

echo "> Setting up new .vim directory"
mkdir $HOME/.vim
mkdir $HOME/.vim/colors

ln -s $HOME/.dotfiles/atom-dark-256.vim $HOME/.vim/colors
ln -s $HOME/.dotfiles/plugins.vim $HOME/.vim/

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

echo "> Installing vim plugins"
vim -c 'PluginInstall' -c 'qa!'
