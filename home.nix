{ pkgs, nixvim, ... }:

{
  home.username = "eric";
  home.homeDirectory = "/home/eric";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    bat
    tig
    glow
    htop
    curl
    cloc
    aspell
    aspellDicts.en
    colordiff

	gdb
    gnumake
    libclang
    cppcheck
    gcc
    cargo
    gleam
  ];

  programs.starship = {
  	enable = true;
	settings = {
	  add_newline = true;
	  command_timeout = 2000;
	};
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      v="nvim";
      l="ls -al";
    };
    initExtra = ''
	  export PATH=$PATH:/opt/riscv/bin
	  export F4PGA_INSTALL_DIR=~/opt/f4pga
      eval "$(starship init bash)"
      cd ~/workspace
    '';
  };  

  programs.git = {
    enable = true;
    userName = "ericlin1231";
    userEmail = "eric1231.tw@gmail.com";
    extraConfig = {
      init.defaultBranch = "master";
    };
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
      vimtex.enable = true;
      todo-comments.settings = {
        enable = true;
        signs = true;
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-commentary
      vim-clang-format
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
      hlsearch = true;
      incsearch = true;
      swapfile = false;
      scrolloff = 5;
      tabstop = 4;
      shiftwidth = 4;
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
