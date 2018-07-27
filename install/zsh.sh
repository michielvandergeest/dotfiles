#!/bin/sh

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo apt-get install zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
    if test ! $(which zsh); then
        echo "> Installing Zsh"
        brew install zsh zsh-completions
    fi
else
    echo "Unknown OS type"
fi

echo "> Setting up Zsh as default shell environment"
chsh -s $(grep /zsh$ /etc/shells | tail -1)


if [ ! -e $HOME/.oh-my-zsh ]; then
    echo "> Installing Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "> Oh My Zsh already installed, you might want to upgrade using 'upgrade_oh_my_zsh'"
fi

echo "> Symlinking .zshrc"
if [ -e $HOME/.zshrc ]; then
    echo "> Backing up existing .zshrc file"
    mv $HOME/.zshrc $HOME/.zshrc.$(date +%Y%m%d_%H%M%S).bak
fi
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
