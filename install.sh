#!/bin/bash

# Populate dotfiles.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/populate.sh

# Get ripgrep
if which rg; then
    echo "RipGrep already installed"
else
    if which yum; then
        sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
        sudo yum install ripgrep
        echo "RipGrep installed"
    elif which dpkg; then
        curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
        sudo dpkg -i ripgrep_0.10.0_amd64.deb
        rm ripgrep_0.10.0_amd64.deb
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

# Get Pip
if which pip3; then
    echo "Pip already installed"
else
    echo "Installing Pip"
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    sudo python3 ./get-pip.py
    rm ./get-pip.py
    echo "Installed Pip"
fi

# TODO platform independent
# sudo apt-get install python3-venv
# sudo apt-get install neovim
# sudo yum install neovim

# Get vim-plug
PLUG_DIR=~/.local/share/nvim/site/autoload/plug.vim
if [ -d "$VUNDLE_DIR" ]; then
    echo "Vim plug already installed"
    echo "Updating VimPlug plugins"
    vim +PlugInstall! +qall
else
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "Vim plug installed"
    echo "Installing Vim plug plugins"
    vim +PlugInstall +qall
fi
