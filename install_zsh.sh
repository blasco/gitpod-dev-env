#!/bin/bash

DOTFILES_ZSH=~/dotfiles/vim
cd $DOTFILES_ZSH

# ZSH shell
apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
rm -f ~/.zshrc
ln -s $DOTFILES_ZSH/zshrc ~/.zshrc

# Oh-my-zsh plugins
git clone https://github.com/lukechilds/zsh-better-npm-completion ~/.oh-my-zsh/custom/plugins/zsh-better-npm-completion
