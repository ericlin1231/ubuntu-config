#!/bin/bash

# Ask sudo Permission
echo "Enter sudo password: "
sudo -v

# General Setting
mkdir -p ~/workspace/share

# Keep sudo permission valid
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Enable helper script execute permission
sudo chmod 777 relink.sh

# Install Chinese input method
sudo apt install ibus-chewing

# Remove old system setting files
rm ~/.bashrc
rm ~/.profile

# Install Nix & Home Manager
sudo apt install nix-bin
sh <(curl -L https://nixos.org/nix/install) --daemon
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

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
bash relink.sh

# Remove temporary dictionary
rm -rf ~/workspace/share

echo "Installation and setup completed!"
