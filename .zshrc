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

## User configuration

# Make <C-P> and <C-N> also search
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search


# Configure keyboard layout with english international without unconfortable dead keys
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

export VISUAL="nvim"
export EDITOR="nvim"
export READER="okular"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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
# Use exa, ls made in Rust, with color highlighting
alias l='exa -lagh'
alias ll='exa -lh'
# Also, bat is a very nice cat implementation which integrates a paginator and a syntax highlighter

# Execute when opening a terminal
neofetch

PATH=$PATH:/home/perseo/Documents/codes/scripts:/usr/local/arm/gcc-arm-none-eabi-4_9-2015q3/bin
