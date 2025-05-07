sudo apt update;
sudo apt upgrade;
sudo apt-get update;
sudo apt-get upgrade;
sudo apt install ripgrep;
sudo apt install fdfind;
sudo apt install fzf;
sudo apt install curl;
sudo apt install zsh;

# i3 / tiling window manager
sudo apt install i3
# Search for KDE and i3 integration GitHub

# Clone dotfiles
git clone https://github.com/c-santos/.dotfiles ~


# Shell
chsh -s $(which zsh)
# zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
ln -s ~/.dotfiles/.zshrc.kubuntu ~/.zshrc
ln -s ~/.dotfiles/.bash_aliases ~
# starship
curl -sS https://starship.rs/install.sh | sh

source ~/.zshrc

# Neovim 
# Get neovim tarball and install
ln -s ~/.dotfiles/nvim ~/.config;

# Tmux
sudo apt install tmux;
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Ghostty / Terminal of choice
sudo snap install ghostty --classic
ln -s ~/.dotfiles/ghostty/config ~/.config/ghostty/config
