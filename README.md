# Dotfiles
Repo for my dotfiles. Any config that I can save as code is here :)

## Setup
Setup scripts are split up by OS. So generally, there are 3 ways:

### MacOS (needs updating)
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
5. Install NVM manually

### Windows

Windows has both the OS itself and WSL to configure.

For Windows itself, double check file locations in the `setup.ps1` file and run it to setup a Windows Terminal.

```sh
. /setup.ps1
```

For WSL, it will depend on the distro. Ubuntu is my common choice so scripts in
`/ubuntu` should work fine. See more at `ws/README.md`

### Linux

Only scripts for Ubuntu is properly setup for now. Most of the required defaults
to run the setup scripts are already installed in Ubuntu so just run and see
what happens :)

## Creating a symlink

Dotfiles are built on the concept of symlinking so I'm keeping it here in case it
comes handy.

``` sh
# MacOS/Linux
ln -s ~/path/to/original ~/path/to/destination

# Windows
New-Item -ItemType SymbolicLink -Path "E:\Files\Documents\WindowsPowershell\Microsoft.Powershell_profile.ps1" -Target "E:\Files\dev\.dotfiles\windows\Microsoft.Powershell_profile.ps1"
```

## tmux

```sh
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

On initial setup, `Ctrl+I` to install plugins. `Ctrl+r` to reload the config file.
After that tmux prefix is now set to `Ctrl+s`.

## Fonts

Here a list of fonts I like:

- FiraCode Nerd Font
- Hack Nerd Font
- CodeNewRoman Nerd Font
- JetBrains Nerd Font

## Todo

- [ ] Better install scripts.

