#!/bin/bash
cp ~/.bashrc .
cp ~/.bash_aliases .
cp ~/.vimrc .
git add -u
git commit -m "dotfiles update"
git push
