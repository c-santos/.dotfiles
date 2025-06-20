sudo apt install tmux

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Link config
sudo ln -s $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf
