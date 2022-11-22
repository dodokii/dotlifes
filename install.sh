printf "Installing dotfiles...\n"
env RCRC=$HOME/dotfiles/rcrc rcup

# ZSH plugins
if [ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]; then
    printf "Installing zsh-autosuggestions for ZSH plugins...\n"
    mkdir -p $ZSH_CUSTOM/plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    printf "done!\n"
fi

if [ ! -d $ZSH_CUSTOM/plugins/zsh-syntax-highlighting ]; then
    printf "Installing zsh-syntax-highlighting for ZSH plugins...\n"
    mkdir -p $ZSH_CUSTOM/plugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    printf "done!\n"
fi

# Vim plugins
if [ ! -d ~/.vim/autoload ]; then
    printf "Installing plug.vim for Vim autoload...\n"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    printf "done!\n"
fi
