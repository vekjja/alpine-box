# Path to Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export PATH=$PATH:~/.local/bin

ZSH_THEME="agnoster"
plugins=(git)

# History Settings
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=$HOME/.zsh_history

# ZSH Globals
export UPDATE_ZSH_DAYS=7 # Update every week

# Zsh Configuration
export COMPLETION_WAITING_DOTS="true" # Waiting dots
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '~/.zshrc'

# Initialize Zsh completion system
autoload -Uz compinit
compinit

##### System ####
alias ..="cd .."
alias please="sudo"
alias ls="ls -G"
alias t="tree"
alias l="tree -L 1"
alias cls="clear"
alias la="ls -lha"

#### Git ####
alias g="git"
alias gp="git push"
alias gs="git status"
alias gb="git branch"
alias gc="git commit"
alias gpll="git pull"
alias gco="git checkout"
alias gl="git log"
function gsquash() {
    git reset $(git merge-base ${1} HEAD)
    git add -A
    git commit -m ${2}
}
function gprune() {
    git fetch origin
    git fetch --prune origin
    git branch --merged | egrep -v "(^\*|master|main)" | xargs git branch -d
}
function gpa() {
    git add --all
    git commit -am ${1}
    git push
}

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

#### Oh My Posh ####
eval "$(oh-my-posh init zsh --config /etc/ohmyposh-themes/kev.omp.json)"
