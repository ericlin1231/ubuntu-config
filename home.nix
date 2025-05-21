{ pkgs, nixvim, ... }:

{
    home.username = "eric";
    home.homeDirectory = "/home/eric";
    home.stateVersion = "25.05";

    home.packages = with pkgs; [
        gh
        bat
        tig
        tree
        glow
        htop
        curl
        cloc
        typst
        gnupg
        aspell
        aspellDicts.en

        gdb
        gnumake
        libclang
        cppcheck
        valgrind
        rustup
        clang
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
            v = "nvim";
            l = "ls -al";
            c = "clear";
            hmsw = "home-manager switch --flake .#eric";
        };
        initExtra = ''
            export PATH=$PATH:/opt/riscv/bin
            export PATH=$PATH:~/.cargo/bin
            eval "$(starship init bash)"
            cd ~/workspace
        '';
    };

    programs.git = {
        enable = true;
        userName = "tzuchilin";
        userEmail = "eric1231.tw@gmail.com";
        aliases = {
            aa = "add .";
            ch = "checkout";
            cm = "commit";
            br = "branch";
            st = "status";
            pmain   = "push origin main";
            pmaster = "push origin master";
        };
        extraConfig = {
            init.defaultBranch = "master";
            commit.gpgsign = true;
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
            web-devicons.enable = true;
            neo-tree.enable = true;
            todo-comments.settings = {
                enable = true;
                signs = true;
            };
        };
        extraPlugins = with pkgs.vimPlugins; [
            vim-commentary
            typst-vim
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
        keymaps = [
            {
                mode = "n";
                key = "<Space>u";
                action = "<C-r>";
            }
            {
                mode = "n";
                key = "<leader>e";
                action = ":Neotree<cr>";
            }
            {
                mode = "n";
                key = "<leader>r";
                action = ":Neotree toggle last<cr>";
            }
        ];
    };

    programs.home-manager.enable = true;
}
