# Path to your oh-my-zsh installation.
export ZSH="/home/perseo/.oh-my-zsh"

ZSH_THEME="agnoster"

export UPDATE_ZSH_DAYS=13

HIST_STAMPS="mm/dd/yyyy"

plugins=(
    archlinux
    git
    history-substring-search
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Configure keyboard layout with english international without unconfortable dead keys
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

export VISUAL="vim"
export EDITOR="nvim"
export READER="okular"

# Compilation flags
 export ARCHFLAGS="-arch x86_64"

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias pac='sudo pacman -S'
alias vim=nvim
alias dotfiles='/usr/bin/git --git-dir=/home/perseo/.dotfiles/ --work-tree=/home/perseo'
alias alacritty='WINIT_HIDPI_FACTOR=1 alacritty'

# Execute when opening a terminal
neofetch

PATH=$PATH:/home/perseo/Documents/codes/scripts
