#!/usr/bin/env zsh

echo "Installing..."

# setup vim plugin manager
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install by rcup
# env RCRC=$HOME/dotfiles/rcrc rcup

set -e

# echo 'updating submodules'
# git submodule update --init --recursive

# echo 'please hold while i build YouCompleteMe'
# TERM=xterm works around https://github.com/mono/mono/issues/6752
# ( cd .vim/bundle/YouCompleteMe; TERM=xterm ./install.py --clang-completer --cs-completer --rust-completer --js-completer )

echo 'linking dotfiles...'
local here=$(dirname $0)
for file in .tmux.conf .vimrc .zshrc .tmuxinator; do
    if [[ $file == '.gitconfig' && $USER != 'eevee' && $USER != 'amunroe' ]]; then
        echo "not linking $file, it has my name in it!  do it yourself"
    else
        if [[ $(readlink -f $HOME/$file) != $(readlink -f $here/$file) ]]; then
            ln -i -s $here/$file $HOME/$file
            echo "linked $file"
        fi
    fi
done

# airline (powerline) font stuff
# if whence fc-cache > /dev/null; then
#     echo 'installing powerline font'
#     mkdir -p ~/.fonts/
#     wget -O ~/.fonts/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
#     fc-cache -vf ~/.fonts/

#     mkdir -p ~/.config/fontconfig/conf.d/
#     wget -O ~/.config/fontconfig/conf.d/10-powerline-symbols.conf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
# else
#     echo 'no fontconfig found; skipping powerline font'
# fi

# ZSH plugins
source ~/.zshrc
echo 'Installing zsh plugins...'
if [ -d $ZSH/custom/plugins/zsh-autosuggestions ]; then
    echo 'zsh-autosuggestions already installed, skip.' 
else
    echo "Installing zsh-autosuggestions for ZSH plugins..."
    mkdir -p $ZSH/custom/plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH:-~/.oh-my-zsh}/custom/plugins/zsh-autosuggestions
    echo "done!"
fi

if [ -d $ZSH/custom/plugins/zsh-syntax-highlighting ]; then
    echo 'zsh-syntax-highlighting already installed, skip.' 
else
    echo "Installing zsh-syntax-highlighting for ZSH plugins..."
    mkdir -p $ZSH/custom/plugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH:-~/.oh-my-zsh}/custom/plugins/zsh-syntax-highlighting
    echo "done!"
fi

# Vim plugins
# if [ ! -d ~/.vim/autoload ]; then
#     printf "Installing plug.vim for Vim autoload...\n"
#     curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#     printf "done!\n"
# fi
