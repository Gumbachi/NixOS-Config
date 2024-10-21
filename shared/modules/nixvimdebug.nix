{ ... }: {
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;
    
    #######################
    ### PLUGINS AND LSP ###
    #######################

    plugins = { 
      yazi.enable = true; # File Management
      lualine.enable = true; # Status Line
      which-key.enable = true; # Input Hints
      comment.enable = true; # Enable easy commenting
 
      autoclose = {
        enable = true;
        options.pairSpaces = true;
      };

      # Treesitter - Enabling indenting causes issues
      treesitter = {
        enable = true;
        settings.highlight.enable = true;
      };

      # Select root for project
      project-nvim = {
        enable = true;
        enableTelescope = true;
        settings.show_hidden = true;
        settings.patterns = [
          ".git"
          "tsconfig.json"
          "_darcs"
          ".hg"
          ".bzr"
          ".svn"
          "Makefile"
          "package.json"
        ];
      };

      # Code Completion 
      cmp = {
        enable = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        settings.mapping = {
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
      };

      # Telescope
      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true; 
        };
        settings.defaults = {
          file_ignore_patterns = [
            "^.git/"
            "^.mypy_cache/"
            "^__pycache__/"
            "^output/"
            "^data/"
            "%.ipynb"
          ];
          layout_config.prompt_position = "top";
          set_env.COLORTERM = "truecolor";
          sorting_strategy = "ascending";
        };
      };

      # LSP
      lsp.enable = true;
      lsp.servers = {
        nil_ls.enable = true; # Nix
      }; 
    };

    ######################
    ### NEOVIM OPTIONS ###
    ######################

    opts = {

      cindent = true;


      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;

      
      number = true; # Line Numbers
      relativenumber = true; # Relative Line Numbers
      clipboard = "unnamedplus"; # Use the system clipboard
      cursorline = true;
      ignorecase = true;
      smartcase = true; 
    };

    ################
    ### BINDINGS ###
    ################

    globals.mapleader = " ";

    keymaps = [
      {
        mode = "n";
        key = "<leader> ";
        action = "<CMD>Telescope find_files hidden=true<CR>";
        options.desc = "Open Telescope";
      }
      {
        key = "<leader>fm";
        action = "<CMD>lua vim.lsp.buf.format()<CR>";
        options.desc = "Format the current buffer";
      }
      {
        key = "<leader>e";
        action = "<CMD>Yazi<CR>";
        options.desc = "Open Yazi";
      } 
    ];

   
  };
}
 
