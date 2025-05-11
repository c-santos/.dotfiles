# Chrome
sudo apt install google-chrome-stable

# Dotfiles
cd ~
git clone https://github.com/c-santos/.dotfiles

sudo sh 1-install-deps.sh
sudo sh 2-install-zsh.sh
sudo sh 3-install-tmux.sh # Install TPM and reload tmuxconf after
sudo sh 4-install-neovim.sh # Set neovim in PATH after
sudo sh 5-install-nvm.sh # Set nvm in PATH after

# Fonts
mkdir $HOME/fonts
# place fonts in this directory

# Git
git config --global credential.helper store
