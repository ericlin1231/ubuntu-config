{ config, pkgs, ... }:

{
  home.username = "eric";
  home.homeDirectory = "/home/eric";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    bat
    htop
    gnumake
    cmake
    curl
    wget
    docker
    texliveFull

    cargo
    sbt
    scalafmt
    sdl3

    yosys
    circt
    nextpnr
    openfpgaloader
    verilator

    pyenv
  ];

  programs.git = {
    enable = true;
    userName = "ericlin1231";
    userEmail = "eric1231.tw@gmail.com";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      v="vim";
      l="ls -la";
    };
    initExtra = ''
      eval "$(starship init bash)"
      cd ~/workspace
    '';
  };  

  programs.starship = {
    enable = true;
  };

  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      vimtex
      vim-commentary
    ];
    settings = {
      expandtab = true;
      smartcase = true;
      ignorecase = true;
      tabstop = 4;
      shiftwidth = 4;
    };
    extraConfig = ''
      set belloff=all
      nnoremap <Space>u <C-r>
    '';
  };

  programs.home-manager.enable = true;
}
