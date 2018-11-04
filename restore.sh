#!/bin/bash
cp -r -i i3 ~/.config
cp -r i3blocks ~/.config
cp .bashrc ~
cp .bash_aliases ~
cp .vimrc ~
cp -r .config ~/.vim/
cp .zshrc ~

if [[ ! -d /home/$USER/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [[ ! -d /home/$USER/GitHub/i3spotifystatus ]]; then
    git clone https://github.com/rpieja/i3spotifystatus.git ~/GitHub/i3spotifystatus
fi
