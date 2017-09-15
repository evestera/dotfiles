ln -s ~/dotfiles/prezto ~/.zprezto
ln -s ~/dotfiles/prezto/runcoms/zlogin ~/.zlogin
ln -s ~/dotfiles/prezto/runcoms/zlogout ~/.zlogout
ln -s ~/dotfiles/prezto/runcoms/zprofile ~/.zprofile
ln -s ~/dotfiles/prezto/runcoms/zshenv ~/.zshenv
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/zpreztorc ~/.zpreztorc

ln -s ~/dotfiles/gitconfig ~/.gitconfig
cp -n ~/dotfiles/gitconfig.local.init ~/dotfiles/gitconfig.local

ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim

ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

echo "If you are ready to change shell, run:"
echo "chsh -s /bin/zsh"
