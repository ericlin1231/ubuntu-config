{ config, pkgs, nixvim, ... }:

{
  home.username = "eric";
  home.homeDirectory = "/home/eric";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    bat
    glow
    htop
    gnumake
    cmake
    curl
    wget
    texliveFull

    (python3.withPackages (pk: with pk; [
      pip
      pandas
      numpy
    ]))
    virtualenv
    cargo
    gcc
    sbt
    scalafmt
    glfw
    sdl3

    yosys
    circt
    nextpnr
    openocd
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
      v="nvim";
      l="ls -al";
    };
    initExtra = ''
      export PATH=$PATH:/opt/riscv/bin
      export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/include/

      eval "$(starship init bash)"
      cd ~/workspace
    '';
  };  

  programs.starship = {
    enable = true;
  };

  programs.java = {
    enable = true;
    package = pkgs.jdk21;
  };

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes = {
      tokyonight = {
        enable = true;
        settings.style = "night";
      };
    };
    plugins = {
      lualine.enable = true;
      sleuth.enable = true;
      vimtex.enable = true;
      todo-comments.settings = {
          enable = true;
          signs = true;
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
        vim-commentary
    ];
    globals = {
        mapleader = " ";
        maplocalleader = " ";
    };
    opts = {
      mouse = "a";
      showmode = false;
      breakindent = true;
      ignorecase = true;
      smartcase = true;
      scrolloff = 5;

      hlsearch = true;
      incsearch = true;
    };
    keymaps = [
        {
            mode = "n";
            key = "<Space>u";
            action = "<C-r>";
        }
    ];
  };

  programs.home-manager.enable = true;
}
