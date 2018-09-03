#!/bin/bash

echo 'source $HOME/dotfiles/bash/bashrc_main.sh' >> ~/.bashrc
cp ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
cp ~/dotfiles/vimrc ~/.vimrc
cp ~/dotfiles/gitconfig ~/.gitconfig
cp ~/dotfiles/ctags ~/.ctags
mkdir -p ~/bin
cp ~/dotfiles/bin/* ~/bin/
