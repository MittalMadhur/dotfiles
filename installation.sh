#!/usr/bin/env bash
set -e

# Install stow
sudo apt update
sudo apt install stow -y

#Install Mason LSP dependencies for some packages
sudo apt install nodejs npm -y

#Intialize stow
cd /home/$USER/dotfiles
stow .

