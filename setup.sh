#!/bin/bash

mkdir -p $HOME/.config

DOTFILES=(.Rprofile .atom .config/omf .gitconfig .tmux.conf)
for file in ${DOTFILES[@]}; do
  ln -sfnv $PWD/$file $HOME/$file
done

if [ ! -d $HOME/.local/share/omf ]; then
  curl -L http://get.oh-my.fish | fish
fi
