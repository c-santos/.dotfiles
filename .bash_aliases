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
alias aliases="nvim ~/.bash_aliases"

# Quick Source Shell
alias refresh="source $ZDOTDIR/.zshrc"
# Quick Source Zsh Env
alias refreshenv="source $HOME/.zshenv"

# Directory Quick Access
alias dev="cd ~/Dev"
alias me="cd ~/Personal"
alias notes="cd ~/notes"

# Neovim
alias v="nvim ."

# Development Shortcuts
alias dc="docker compose"

# Git aliases
alias gmp='git checkout master; git pull;'
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
    git remote -v | cut -w -f2 | fzf-tmux -p | xargs open
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
    proj=$(fd . ~/Dev --type d -a -d 1 | fzf-tmux -p)

    if [[ -n $proj ]] then
        echo "\n\t🛬 You are now in: $proj\n"
        cd $proj
    fi
}
alias fp=find_project
alias f='fdfind --hidden --exclude .git| fzf-tmux -p | xargs nvim'

