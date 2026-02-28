alias l="ls -latr"

# Config Quick Access
alias conf="cd $XDG_CONFIG_HOME"
alias dots="cd ~/.dotfiles"

alias zshconf="nvim $ZDOTDIR/.zshrc"
alias zshenv="nvim ~/.zshenv"

alias nvconf="cd ~/.config/nvim; nvim ."
alias alaconf="nvim ~/.config/alacritty"
alias tmuxconf="nvim ~/.tmux.conf"
alias wezconf="cd ~/.config/wezterm; nvim ."
alias ghostconf="nvim ~/.config/ghostty/config"
alias aliases="nvim $ZDOTDIR/.bash_aliases"

# Quick Source Shell
alias refresh="source $ZDOTDIR/.zshrc"
# Quick Source Zsh Env
alias refreshenv="source $HOME/.zshenv"

# Directory Quick Access
alias home="cd ~"
alias dev="cd ~/Dev"
alias me="cd ~/Personal"
alias notes="cd ~/notes"

# Neovim
alias v="nvim ."

# Development Shortcuts
alias dc="docker compose"

# Git aliases
pull_main() {
    if git rev-parse --verify main >/dev/null 2>&1; then
        git checkout main && git pull;
    elif git rev-parse --verify master >/dev/null 2>&1; then
        git checkout master && git pull;
    else
        echo "Neither main nor master branch found.";
    fi;
}

alias gmp=pull_main
alias gdp='git checkout develop; git pull;'
alias gm='git checkout master'
alias gs='git status'
alias gco='git checkout'
alias gcb='git checkout -b'
alias grn='git branch -m'
alias gt='git log --all --decorate --oneline --graph'
alias gb='git branch -a -vv'
alias gsl='git stash list'
alias gsp='git stash pop'

checkout_advanced() {
    if [[ -n $1 ]] then
        git checkout $1
        return
    fi
    git branch | fzf-tmux -p | xargs git checkout
}
alias gco=checkout_advanced

stash-curr() {
    git stash save $1
}
alias gss=stash-curr

apply-stash() {
    git stash apply $1
}
alias gsa=apply-stash

open-git-remote() {
    repo_url=$(git remote get-url origin)
    echo $repo_url
    if [[  $repo_url == *"https://"*  ]]; then
        explorer.exe "$repo_url"
    elif [[ $repo_url == *"git@"* ]]; then
        domain=$(git remote get-url origin | cut -d "@" -f2 | cut -d ":" -f1)
        owner=$(git remote get-url origin | cut -d ":" -f2 | cut -d "/" -f1)
        repo=$(git remote get-url origin | cut -d "/" -f2)

        https_url="https://$domain/$owner/$repo"
        explorer.exe "$https_url"
    fi
}
alias remote=open-git-remote

create-commit() {
    git commit -m "$1"
}
alias gc=create-commit

reset-soft-commit() {
    git reset --soft HEAD~$1
}
alias grs=reset-soft-commit

# Fuzzy Find Aliases
# deps: fzf, fdfind
find_project() {
    local proj

    # find cmd changes dep on OS
    proj=$(fdfind . ~/Dev --type d -a -d 1 | fzf-tmux -p)

    if [[ -n $proj ]] then
        echo "\n\t🛬 You are now in: $proj\n"
        cd $proj
    fi
}
alias fp=find_project
alias f='fdfind --hidden --exclude .git| fzf-tmux -p | xargs nvim'


connect_to_logscale_cluster() {
    read "environment? dev or prod (d/p)?"
    if [[ $environment = "p" ]]; then
        echo "Connecting to PROD logscale cluster... (aks-spyglass-l-prd-593b)"

        az account set --subscription 2bd6b591-b2a6-4b87-b83b-f3bdb7039ad2
        az aks get-credentials --resource-group AZ-RG-ITS-Observability-LOGSCALE-Prod-01 --name aks-spyglass-l-prd-593b --overwrite-existing
        kubelogin convert-kubeconfig -l azurecli
        k9s
    elif [[ $environment = "d" ]]; then
        echo "not configured yet... pls configure..."
    fi
}

connect_to_core_cluster() {
    read "environment? dev or prod (d/p)?"
    if [[ "$environment" = "p" ]]; then
        echo "Connecting to PROD core cluster... (aks-spyglass-c-prd-80fe)"
        az account set --subscription 2bd6b591-b2a6-4b87-b83b-f3bdb7039ad2
        az aks get-credentials --resource-group AZ-RG-ITS-Observability-CORE-AKS-Prod-01 --name aks-spyglass-c-prd-80fe --overwrite-existing
        kubelogin convert-kubeconfig -l azurecli
        k9s
    elif [[ "$environment" = "d" ]]; then
        echo "Connecting to DEV core cluster... (aks-spyglass-c-dev-ee8c)"
        az account set --subscription efe1f290-b6e7-4375-9359-caeeb15e7c6f
        az aks get-credentials --resource-group AZ-RG-ITS-Observability-CORE-AKS-Dev-01 --name aks-spyglass-c-dev-ee8c --overwrite-existing
        kubelogin convert-kubeconfig -l azurecli
        k9s
    fi

}

alias kcl=connect_to_logscale_cluster
alias kcc=connect_to_core_cluster

alias c="code --remote wsl+Ubuntu-24.04 ."
