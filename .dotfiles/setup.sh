alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout

echo "Configuring Vim..."
vim +slient +VimEnter +PlugInstall +qall
vim +silent -c 'CocInstall coc-marketplace coc-clangd coc-python coc-tsserver'


# TODO config...
# Install mongodb
cd ~
mkdir sources
cd sources
git clone https://aur.archlinux.org/mongodb-bin.git
cd mongodb-bin
makepkg -si
systemctl enable mongodb.service
systemctl start mongodb.service
mongo --version

