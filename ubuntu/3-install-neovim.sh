sudo apt gcc
sudo apt install fzf
sudo apt install fdfind
sudo apt install xclip
sudo apt install ripgrep

# Download tarball and extract.
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Make sure to set in neovim in PATH if not already.

# Link config.
sudo ln -s $DOTFILES/nvim $XDG_CONFIG_HOME/nvim

# Delete tar
rm nvim-linux-x86_64.tar.gz

echo "neovim installed and configured. run once to complete its setup"
