#!/bin/bash

rm -rf ~/.config/nix/

mkdir -p ~/.config/nix/
ln nix.conf ~/.config/nix/nix.conf
