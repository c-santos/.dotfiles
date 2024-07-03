# Dotfiles

repo for Dotfiles

## Todo

- [ ] Install scripts

## Creating a symlink

``` sh
ln -s ~/path/to/original ~/path/to/destination
```


## zsh

### oh-my-zsh

#### zsh-autosuggestions

``` sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- add to plugins in .zshrc

``` sh
plugins=(git nvm zsh-syntax-highlighting zsh-autosuggestions)
```

#### fzf

```sh
brew install fzf
```

```sh
sudo apt install fzf
```

#### fd find

```sh
brew install fd
```

```sh
sudo apt install fd-find
```

### Create symlink

For MacOS,

```sh
ln -s ~/.dotfiles/.zshrc.macos ~/.zshrc
```

For WSL,

```sh
ln -s ~/.dotfiles/.zshrc.wsl ~/.zshrc
```

## Alacritty

For MacOS,

```sh
# alacritty config
ln -s ~/.dotfiles/alacritty/alacritty_macos.toml ~/.config/alacritty/alacritty.toml
```

```sh
# kanagawa theme
ln -s ~/.dotfiles/alacritty/kanagawa_dragon.toml ~/.config/alacritty/kanagawa_dragon.toml
```

For WSL,

```sh
ln -s ~/.dotfiles/alacritty/alacritty_wsl.toml ~/AppData/Roaming/alacritty/alacritty.toml
```

```sh
ln -s ~/.dotfiles/alacritty/kanagawa_dragon.toml ~/AppData/Roaming/alacritty/kanagawa_dragon.toml
```

- FiraCode Nerd Font
- Kanagawa Dragon Theme

## tmux

- tmp
- kanagawa-tmux

```sh
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

On initial setup, `Ctrl+I` to install plugins. `Ctrl+b` to source the config file.
After that tmux prefix is now set to `Ctrl+s`.

## Neovim

```sh
ln -s ~/.dotfiles/nvim ~/.config/nvim
```

Load initial Neovim config to allow Lazy and Mason to install.


## VSCode

- keybindings json
- settings json
