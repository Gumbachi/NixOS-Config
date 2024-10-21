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
        options.autoIndent = true;
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
 
