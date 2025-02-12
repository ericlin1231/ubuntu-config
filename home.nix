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
    texliveFull

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
      nnoremap <Space>u <C-r>
    '';
  };

  programs.home-manager.enable = true;
}
