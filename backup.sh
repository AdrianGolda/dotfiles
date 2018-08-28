#!/bin/bash
cp ~/.bashrc .
cp ~/.bash_aliases .
cp ~/.vimrc .
cp ~/.vim/.config/ . -r
git add -u
git commit -m "dotfiles update"
git push
