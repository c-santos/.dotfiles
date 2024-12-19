# Dotfiles

repo for Dotfiles

## Todo

- [ ] Better install scripts.

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

## tmuxinator

tmux session templater using yaml files.

``` sh
brew install tmuxinator
```

Add templates to `~/.config/tmuxinator/sample.yml`.

Run template session with `[tmuxinator]/[mux] sample`.

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

- Hack Nerd Font
- FiraCode Nerd Font
- JetBrains Nerd Font
- GeistMono Nerd Font
- SauceCodePro Nerd Font
