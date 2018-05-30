#!/bin/bash

# Get ripgrep
if which rg; then
    echo "RipGrep already installed"
else
    if which yum; then
        sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
        sudo yum install ripgrep
        echo "RipGrep installed"
    elif which dpkg; then
        curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
        sudo dpkg -i ripgrep_0.8.1_amd64.deb
        rm ripgrep_0.8.1_amd64.deb
        echo "RipGrep installed"
    else
        echo "RipGrep install failed - could not identify Linux distribution"
    fi
fi

# Get Fzf
if which fzf; then
    echo "Fzf already installed"
else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    echo "Fzf installed"
fi

# Get Vundle
VUNDLE_DIR=~/.vim/bundle/Vundle.vim
if [ -d "$VUNDLE_DIR" ]; then
    echo "Vundle already installed"
    echo "Updating Vundle plugins"
    vim +PluginInstall! +qall
else
    mkdir -p ~/.vim/bundle && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "Vundle installed"
    echo "Installing Vundle plugins"
    vim +PluginInstall +qall
fi
