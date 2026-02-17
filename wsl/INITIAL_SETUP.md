# Initial Setup

This is my notebook, dump, log for the initial setup I did coming from a blank slate in Windows.

1. Git clone dotfiles
2. Followed ubuntu/ folder and fixed some things
3. Added go install script
4. amended some breaking changes in neovim
5. Downloaded fonts

WSL will be highly dependent on the distro you install. For most cases, I will
be using Ubuntu as my distro.

## Git credentials

To authenticate to my Github account, it is preferred to use Git Credential Manager.
It's more secure yada yada. It is packaged with Git for Windows.

More here: https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md

```sh
# After installing Git for Windows, 
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"

```
