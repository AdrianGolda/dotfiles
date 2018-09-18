#!/bin/bash
cp ~/.bashrc .
cp ~/.bash_aliases .
cp ~/.vimrc .
cp -r ~/.vim/.config/ .
git add -u
git commit -m "dotfiles update"
git push
