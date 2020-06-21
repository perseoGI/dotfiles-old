alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout

echo "Configuring Vim..."
vim +slient +VimEnter +PlugInstall +qall
vim +silent -c 'CocInstall coc-marketplace coc-clangd coc-python coc-tsserver'
