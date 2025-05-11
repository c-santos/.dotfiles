sudo apt install zsh

# Setup ZSH environment
sudo ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv
source ~/.zshenv # $ZDOTDIR is available after sourcing .zshenv

# Link bash aliases
sudo ln -s ~/.dotfiles/.bash_aliases $ZDOTDIR/.bash_aliases

# Install zinit plugin manager
sudo ln -s ~/.dotfiles/zsh/.zshrc $ZDOTDIR/.zshrc
source ~/.zshrc

# Install starship.rs prompt
sudo curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init zsh)"' >> $ZDOTDIR/.zshrc

source $ZDOTDIR/zsh
