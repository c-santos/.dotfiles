# Dotfiles

repo for Dotfiles

## Todo

- [ ] Better install scripts.

## Step
1. Install **Homebrew**
2. Install Git if not yet
3. **Clone** this repo
2. Install **zsh**
3. Install **zinit** plugin manager
4. Install dependencies with Homebrew

```sh
brew install neovim;
brew install fzf;
brew install fd;
brew install unzip;
brew install ripgrep; #nvim: for telescope
```

## Windows Setup

Double check file locations in the `setup.ps1` file and run it to setup a Windows Terminal.

```sh
. /setup.ps1
```

## Creating a symlink

MacOS/Linux

``` sh
ln -s ~/path/to/original ~/path/to/destination
```

Windows

``` sh
New-Item -ItemType SymbolicLink -Path "E:\Files\Documents\WindowsPowershell\Microsoft.Powershell_profile.ps1" -Target "E:\Files\dev\.dotfiles\windows\Microsoft.Powershell_profile.ps1"
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

#### zoxide

```sh
brew install zoxide
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

## Alacritty and Wezterm

For MacOS,

```sh
# alacritty config
ln -s ~/.dotfiles/alacritty/alacritty_macos.toml ~/.config/alacritty/alacritty.toml
```

```sh
# wezterm config
ln -s ~/.dotfiles/wezterm ~/.config/weztermtoml
```

```sh
# kanagawa theme
ln -s ~/.dotfiles/alacritty/kanagawa_dragon.toml ~/.config/alacritty/kanagawa_dragon.toml
```

For WSL,

```sh
ln -s ~/.dotfiles/alacritty/alacritty_wsl.toml /mnt/c/Users/{username}/AppData/Roaming/alacritty/alacritty.toml
```

```sh
ln -s ~/.dotfiles/alacritty/kanagawa_dragon.toml /mnt/c/Users/{username}/AppData/Roaming/alacritty/kanagawa_dragon.toml
```

## tmux

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
These are synced through my GitHub profile.

## Fonts

Here a list of fonts I like: 

- FiraCode Nerd Font
- Hack Nerd Font
- CodeNewRoman Nerd Font
- JetBrains Nerd Font
