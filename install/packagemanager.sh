#!/bin/sh

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo apt-get update
    sudo apt-get upgrade
elif [[ "$OSTYPE" == "darwin"* ]]; then
    if test ! $(which brew); then
        echo "> Installing Homebrew"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    echo "> Updating Homebrew"
    brew update
else
    echo "Unknown OS type"
fi
