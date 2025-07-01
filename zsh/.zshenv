export DOTFILES="$HOME/.dotfiles"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache

# NVIM
export VIMCONFIG="$XDG_CONFIG_HOME/nvim"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

export EDITOR="nvim"
export VISUAL="nvim"

# PYTHON
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/bin/openssl"
