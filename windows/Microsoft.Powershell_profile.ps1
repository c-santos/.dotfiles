function GoToDev
{
    Set-Location "E:\Files\dev"
}

function GoToPwshConfig
{
    Set-Location "E:\Files\Documents\WindowsPowershell"
}

function GoToConfigDir {
    Set-Location "$HOME\.config"
}

function GoToDocs
{
    Set-Location "E:\Files\Documents"
}

function GoToAlacrittyConfig
{
    Set-Location "C:\Users\jcms1\AppData\Roaming\alacritty"
}

function GoToNeovimConfig
{
    Set-Location "C:\Users\jcms1\AppData\Local\nvim"
}

function OpenNeovim
{
    Invoke-Expression "nvim ."
}

function SourcePowerShellProfile
{
    Write-Output "Sourcing profile located at: $PROFILE"
    Invoke-Expression '. "$PROFILE"'
}

function GoHome
{
    Invoke-Expression 'cd "$HOME"'
}

function GoToDotfiles
{
    Set-Location "E:\Files\dev\.dotfiles"
}

# Git aliases

function GitStatus
{
    Invoke-Expression "git status"
}

function GitNewBranch
{
    Invoke-Expression "git checkout -b $args"
}

function GitRenameBranch
{
    Invoke-Expression "git branch -m $args"
}

function GitCheckout
{
    Invoke-Expression "git checkout $args"
}

function GitStashList
{
    Invoke-Expression "git stash list"
}

function GitStashApply
{
    Invoke-Expression "git stash apply $args"
}

function GitStashSave
{
    Invoke-Expression "git stash save $args"
}

function GitBranchDelete
{
    if ($args -eq $null)
    {
        Invoke-Expression "git branch | fzf"
    }
    Invoke-Expression "git branch -D $args"
}

function GitOpenRemote
{
    git remote -v | ForEach-Object { ($_ -split '\s+')[1] } | Sort-Object -Unique | fzf | ForEach-Object { Start-Process "chrome" $_ }
}

Set-Alias dev GoToDev
Set-Alias docs GoToDocs
Set-Alias shconf GoToPwshConfig
Set-Alias nvconf GoToNeovimConfig
Set-Alias conf GoToConfigDir
Set-Alias v OpenNeovim
Set-Alias refresh SourcePowerShellProfile
Set-Alias gs GitStatus
Set-Alias ~ Home
Set-Alias dots GoToDotfiles
Set-Alias gcb GitNewBranch
Set-Alias grn GitRenameBranch
Set-Alias gco GitCheckout
Set-Alias gsl GitStashList
Set-Alias gss GitStashSave
Set-Alias gsa GitStashApply
Set-Alias gbd GitDeleteBranch
Set-Alias remote GitOpenRemote

Invoke-Expression (&starship init powershell)
