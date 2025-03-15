{ pkgs, nixvim, ... }:

{
    home.username = "eric";
    home.homeDirectory = "/home/eric";
    home.stateVersion = "24.11";

    home.packages = with pkgs; [
        gh
        bat
        tig
        glow
        htop
        curl
        cloc
        gnupg
        aspell
        aspellDicts.en

        gdb
        gnumake
        libclang
        cppcheck
        gcc
        rustup
        gleam
    ];

    editorconfig = {
        enable = true;
        settings = {
            "*" = {
                end_of_line = "lf";
                insert_final_newline = true;
                trim_trailing_whitespace = true;
                indent_style = "space";
                indent_size = 4;
            };
            "Makefile".indent_style = "tab";
        };
    };

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
        ];
        globals = {
            mapleader = " ";
            maplocalleader = " ";
        };
        opts = {
            mouse = "a";
            showmode = false;
            ignorecase = true;
            smartcase = true;
            hlsearch = true;
            incsearch = true;
            swapfile = false;
            scrolloff = 5;
            textwidth = 80;
        };
        extraConfigVim = ''
            highlight OverLength ctermbg=red ctermfg=white guibg=#592929
            match OverLength /\%81v.\+/
        '';
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
