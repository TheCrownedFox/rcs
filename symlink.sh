#!/bin/bash

cd $HOME
mkdir -p bin/gits
cd bin/gits
git clone https://github.com/TheCrownedFox/emacsConfig
git clone https://github.com/TheCrownedFox/vimPlugins
# toggle mouse util
git clone https://github.com/TheCrownedFox/toggleMouse
cd toggleMouse
make
cd $HOME/bin
ln -s $HOME/bin/toggleMouse/toggleMouse toggleMouse
# toggle setBright util
git clone https://github.com/TheCrownedFox/setBright
# need to init sub modules
ln -s $HOME/emacsConfig .emacs.d
ln -s $HOME/vimPlugins .vim
ln -s $HOME/rcs/bashrc $HOME/.bashrc
ln -s $HOME/rcs/vimrc $HOME/.vimrc
ln -s $HOME/rcs/zshrc $HOME/.zshrc
ln -s $HOME/rcs/zshenv $HOME/.zshenv
ln -s $HOME/rcs/Xmodmap $HOME/.Xmodmap
ln -s $HOME/rcs/Xdefaults $HOME/.Xdefaults
ln -s $HOME/rcs/xinitrc $HOME/.xinitrc
mkdir $HOME/.xmonad
ln -s $HOME/rcs/EirXmonad.hs $HOME/.xmonad/xmonad.hs
ln -s $HOME/rcs/sqliterc $HOME/.sqliterc
