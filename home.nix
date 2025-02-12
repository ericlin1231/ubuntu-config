{ config, pkgs, ... }:

{
  home.username = "eric";
  home.homeDirectory = "/home/eric";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    git
    bat
    htop
    gnumake
    cmake
    curl
    wget

    cargo

    yosys
    verilator

    pyenv
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      v="vim";
      l="ls -la";
    };
    initExtra = ''
      eval "$(starship init bash)"
    '';
  };  

  programs.starship = {
    enable = true;
  };

  programs.home-manager.enable = true;
}
