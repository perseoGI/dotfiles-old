alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout

echo "Configuring Vim..."
vim +slient +VimEnter +PlugInstall +qall
