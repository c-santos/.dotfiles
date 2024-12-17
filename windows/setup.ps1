$PWSH_FILENAME="Microsoft.Powershell_Profile_Custom.ps1"
$DOTFILES_LOCATION="E:\Files\dev\.dotfiles"

# install neovim dependencies
winget install BurntSushi.ripgrep.MSVC
winget install junegunn.fzf

# symlink nvim
New-Item -ItemType SymbolicLink -Path "$HOME\AppData\Local\nvim" -Target "$DOTFILES_LOCATION\nvim"

# symlink powershell
New-Item -ItemType SymbolicLink -Path "E:\Files\Documents\WindowsPowerShell\$PWSH_FILENAME" -Target "$DOTFILES_LOCATION\windows\$PWSH_FILENAME" 
