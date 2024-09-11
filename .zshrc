# Path to your oh-my-zsh installation.
export ZSH="/Users/${USER}/.oh-my-zsh"
export UPDATE_ZSH_DAYS=15

ZSH_THEME="robbyrussell"
DISABLE_UPDATE_PROMPT="true"
HIST_STAMPS="yyyy-mm-dd"

# Loading plugins
plugins=(git ruby bundler)

# Reload config
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export PAGE='less -RS'

# Aliases
alias whatisrunning="sudo lsof -i -n -P | grep TCP | grep 3000"

# gpg
export GPG_TTY=$(tty)

# Functions

git () {
  if command git "$@"; then
    [[ $1 == "clone" ]] && cd "${${2##*/}%.git}"
  fi
}

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(mise activate zsh)"
