
# Dotfiles

## TODO

- [ ] Create macos and wsl versions of each file if needed e.g `alacritty.macos.toml` and `alacritty.wsl.toml`.

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

#### Create symlink

```sh
ln -s ~/.dotfiles/.zshrc.macos ~/.zshrc
```

```sh
ln -s ~/.dotfiles/.zshrc.wsl ~/.zshrc
```

## Alacritty

For MacOS,

```sh
ln -s ~/.dotfiles/alacritty/alacritty_macos.toml ~/.config/alacritty/alacritty.toml
```

```sh
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

## Neovim

- craziness

## VSCode

- keybindings json
- settings json
