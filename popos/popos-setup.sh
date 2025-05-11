# Chrome
sudo apt install google-chrome-stable

# Dotfiles
cd ~
git clone https://github.com/c-santos/.dotfiles

# Dependencies
sudo apt install fzf;
sudo apt install fdfind;
sudo apt install ripgrep;
sudo apt install curl;
sudo apt install zsh;

# Zshell
sudo apt install zsh;

sudo ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv;
source ~/.zshenv;

# zinit
sudo ln -s ~/.dotfiles/zsh/.zshrc $ZDOTDIR/.zshrc;
source ~/.zshenv;

# bash aliases
sudo ln -s ~/.dotfiles/.bash_aliases $ZDOTDIR/.bash_aliases;

# starship.rs
sudo curl -sS https://starship.rs/install.sh | sh;
echo 'eval "$(starship init zsh)"' >> $ZDOTDIR/.zshrc;

source $ZDOTDIR/zsh;

# TMUX
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo apt install tmux;

# Neovim
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -s $DOTFILES/nvim $XDG_CONFIG_HOME/nvim

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | sh
echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> $ZDOTDIR/.zshrc;
nvm install --lts
nvm use --lts

# Fonts
mkdir $HOME/fonts
# place fonts in this directory
