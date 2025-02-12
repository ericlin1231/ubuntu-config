#!/bin/bash

# Ask sudo Permission
echo "Enter sudo password: "
sudo -v

# Keep sudo Permission Valid
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Noto.zip
mkdir -p ~/.local/share/fonts
unzip Noto.zip "*.ttf" -d ~/.local/share/fonts
fc-cache fv
rm Noto.zip

# Install RISC-V Toolchain
sudo mkdir -p /opt/riscv
git clone https://github.com/riscv-collab/riscv-gnu-toolchain.git
cd riscv-gnu-toolchain
./configure --prefix=/opt/riscv
sudo make linux
rm -rf riscv-gnu-toolchain

# Install Discord
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo apt install ./discord.deb
rm discord.deb

# Setting Environment
sudo chmod 700 relinking.sh
bash relinking.sh

echo "Installation and setup completed!"
