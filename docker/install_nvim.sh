DOTFILES_VIM=/home/gitpod/dotfiles/vim
cd $DOTFILES_VIM

# Vim
sudo add-apt-repository -y ppa:jonathonf/vim
sudo apt-get update
sudo apt-get install -y vim
rm -rf ~/.vim
sudo ln -s $DOTFILES_VIM ~/.vim
vim +PlugInstall +qall

# Nvim
mkdir -p ~/programs/neovim
cd ~/programs/neovim

wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
if [ -f /usr/bin/nvim ] ; then
    sudo rm /usr/bin/nvim
fi
sudo ln -s ~/programs/neovim/nvim-linux64/bin/nvim /usr/bin/nvim
rm -f nvim-linux64.tar.gz

if [ -L $HOME/.config/nvim ] ; then
    echo "Deleting old nvim config"
    rm -f $HOME/.config/nvim
fi
mkdir -p ~/.config
ln -s $DOTFILES_VIM  $HOME/.config/nvim
/usr/bin/nvim +PlugInstall +qall

if [ ! -f $DOTFILES_VIM/.vim_initialized ] ; then
    touch $DOTFILES_VIM/.vim_initialized
fi
