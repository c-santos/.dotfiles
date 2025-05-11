sudo apt install zsh;

sudo ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv;
source ~/.zshenv;
sudo ln -s ~/.dotfiles/zsh/.zshrc $ZDOTDIR/.zshrc;
sudo ln -s ~/.dotfiles/.bash_aliases $ZDOTDIR/.bash_aliases;

sudo curl -sS https://starship.rs/install.sh | sh;
echo 'eval "$(starship init zsh)"' >> $ZDOTDIR/.zshrc;

exec zsh;
