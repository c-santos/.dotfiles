sudo apt-get update;
sudo apt install man;
sudo apt install git;
sudo apt install curl;
sudo apt install vim;
sudo apt install gcc;
sudo apt install zip;
sudo apt install ripgrep;
sudo apt install fdfind;
sudo apt install fzf;
sudo apt install tmux;

mkdir ~/.config;
mkdir ~/Dev;

# Install zinit -- zsh plugin manager
# Search internet for bash install cmd

# Install starship prompt
# Search internet for bash install cmd

# Copy zinit plugins and aliases from .zshrc.light.wsl file

# Install neovim
# Get neovim tarball and install

# Symlink neovim config
ln -s ~/.dotfiles/nvim ~/.config;

# Symlink tmuxconf
ln -s ~/.dotfiles/.tmux.conf ~;
# Install Tmux plugin manager
# Search internet and install
# Afterwards, Prefix + r to reload config and Prefix + I to install plugins

# Allow to use Docker in WSL without sudo
sudo chmod 666 /var/run/docker.sock

# Install github cli
# Maybe we could find a better way to authenticate without PATs
