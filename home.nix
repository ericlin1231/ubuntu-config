{ pkgs, nixvim, ... }:

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

    gcc
    cargo
    gleam
  ];

  programs.starship.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      v="nvim";
      l="ls -al";
    };
    initExtra = ''
      eval "$(starship init bash)"
      cd ~/workspace
    '';
  };  

  programs.git = {
    enable = true;
    userName = "ericlin1231";
    userEmail = "eric1231.tw@gmail.com";
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
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
