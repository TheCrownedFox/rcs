#!/bin/bash

cd $HOME
# get config files from github
mkdir -p bin/gits
cd bin/gits
git clone https://github.com/TheCrownedFox/emacsConfig
git clone https://github.com/TheCrownedFox/vimPlugins
# toggle setBright util
git clone https://github.com/TheCrownedFox/setBright
cd $HOME
# TODO need to init sub modules
ln -s $HOME/bin/gits/emacsConfig $HOME/.emacs.d
ln -s $HOME/bin/gits/vimPlugins $HOME/.vim
# symlink rc files
ln -s $HOME/rcs/bashrc $HOME/.bashrc
ln -s $HOME/rcs/sqliterc $HOME/.sqliterc
ln -s $HOME/rcs/tmux.conf $HOME/.tmux.conf
ln -s $HOME/rcs/vimrc $HOME/.vimrc
ln -s $HOME/rcs/Xdefaults $HOME/.Xdefaults
ln -s $HOME/rcs/xinitrc $HOME/.xinitrc
ln -s $HOME/rcs/xmobarrc $HOME/.xmobarrc
ln -s $HOME/rcs/Xmodmap $HOME/.Xmodmap
ln -s $HOME/rcs/zshenv $HOME/.zshenv
ln -s $HOME/rcs/zshrc $HOME/.zshrc
# setup xmonad stuff
mkdir $HOME/.xmonad
ln -s $HOME/rcs/EirXmonad.hs $HOME/.xmonad/xmonad.hs
