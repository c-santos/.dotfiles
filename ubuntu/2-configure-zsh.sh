#!/bin/zsh

# Install zinit plugin manager
sudo ln -s ~/.dotfiles/zsh/.zshrc $ZDOTDIR/.zshrc
. $ZDOTDIR/.zshrc

# Install starship.rs prompt
sudo curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init zsh)"' >> $ZDOTDIR/.zshrc

. $ZDOTDIR/.zshrc

echo "configured zsh successfully!"
echo "enter zsh by: 'zsh'"
