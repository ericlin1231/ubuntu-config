#!/bin/bash

# Ask sudo Permission
echo "Enter sudo password: "
sudo -v

# General Setting
mkdir -p ~/workspace/share

# Keep sudo Permission Valid
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Nix & Home Manager
sh <(curl -L https://nixos.org/nix/install) --daemon
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
rm ~/.profile

# Install Fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Noto.zip
mkdir -p ~/.local/share/fonts
unzip Noto.zip "*.ttf" -d ~/.local/share/fonts
fc-cache fv
rm Noto.zip

# Install Discord
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo apt install ./discord.deb
rm discord.deb

# Setting Environment
sudo chmod 700 relinking.sh
bash relinking.sh

echo "Installation and setup completed!"
