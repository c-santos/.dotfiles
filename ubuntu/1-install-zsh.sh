#!/bin/bash

sudo apt install zsh

# Create zsh config directory
mkdir ~/.config/zsh

# Setup ZSH environment
sudo ln -s $HOME/.dotfiles/zsh/.zshenv $HOME/.zshenv
. $HOME/.zshenv # $ZDOTDIR is available after sourcing .zshenv

# Link bash aliases
sudo ln -s $HOME/.dotfiles/.bash_aliases $ZDOTDIR/.bash_aliases

# Set zsh as default shell
chsh -s $(which zsh)

echo "zsh installed successfully!"

echo "now run: 'zsh 2-configure-zsh.sh'"
