# Windows

This folder is for setting up a Windows development environment from scratch.

## Assumptions

1. Windows 11 is the OS installed.
2. You have internet.
3. You have a blank slate i.e no installs of Docker, WSL, etc.
4. You will use Windows Terminal as default terminal.
5. You will use Ubuntu as the distro.

## Steps

1. WSL

WSL is the only way to develop in Windows. Look for guides online on how to install. The command should be something like below or similar.

```sh
# Run this all in power shell

# This will install WSL itself. By default, I believe it will install itself and its mountpoints on the OS drive.
wsl 

# Install a distro.
wsl --install Ubuntu-2x.xx # whatever is the LTS
```

Ubuntu is the distro of choice since there are defaults already installed like git etc.
Note to self: make a Debian guide in the future too.

2. Dotfiles

https://www.github.com/c-santos/.dotfiles
I have config for most things in this repo. Clone to $HOME.

``` sh
cd ~
git clone https://www.github.com/c-santos/.dotfiles.git
```

3. Follow this guide
