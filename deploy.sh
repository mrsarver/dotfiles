#!/usr/bin/env bash
set -e

# platform detection
platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == "Linux" ]]; then
    platform='linux'
elif [[ "$unamestr" == "Darwin" ]]; then
    platform='osx'
fi

# use macvim on osx
if [[ $platform == 'osx' ]]; then
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
fi

for path in .vimrc .vim .bash_aliases .bash_profile .bashrc .screenrc; do
    echo $path
    if [ ! -h ~/$path ]; then
        ln -vis ~/.dotfiles/$path ~/$path
    fi
done

rm -rf ~/.vim/bundle/Vundle.vim && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim || true
curl https://raw.githubusercontent.com/baskerville/bubblegum/master/colors/bubblegum-256-dark.vim > ~/.vim/colors/bubblegum-256-dark.vim
vim +BundleInstall +qall
echo "Deploy done!"
