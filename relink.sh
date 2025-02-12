#!/bin/bash

rm -f ~/.bashrc
rm -f ~/.vimrc
rm -rf ~/.config/nix/

ln bashrc ~/.bashrc
ln vimrc ~/.vimrc
mkdir -p ~/.config/nix/
ln nix.conf ~/.config/nix/nix.conf
