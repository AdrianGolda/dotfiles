#!/bin/bash
cp -r ~/.config/i3 .
cp ~/.bashrc .
cp ~/.bash_aliases .
cp ~/.vimrc .
cp -r ~/.vim/.config/ .
cp ~/.zshrc .
git add -u
git commit -m "dotfiles update"
git push
