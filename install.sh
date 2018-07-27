#!/bin/sh

echo "> Setting up this machine"

# set executable permissions on install scripts
chmod +x ./install/*

./install/packagemanager.sh
./install/zsh.sh
./install/vim.sh
