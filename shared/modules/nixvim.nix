{ ... }: {
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;

    #######################
    ### PLUGINS AND LSP ###
    #######################
    
    plugins = {

      # General Plugins
      bufferline.enable = true;
      web-devicons.enable = true;
      yazi.enable = true;
      lualine.enable = true;
      which-key.enable = true;
      rainbow-delimiters.enable = true;
      nvim-autopairs.enable = true;
      comment.enable = true; 
      project-nvim = {
        enable = true;
        enableTelescope = true;
        settings.show_hidden = true;
      };

      # Code Completion
      coq-nvim = {
        enable = true;
        installArtifacts = true;
        settings = {
          auto_start = "shut-up";
        };
      };

      # Treesitter
      treesitter = {
        enable = true;
        settings.indent.enable = true;
        settings.highlight.enable = true;
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
      lsp-format.enable = true;
      lsp-status.enable = true;
      lsp-lines.enable = true;
      lsp = {
        enable = true;
        servers = {
          # basedpyright.enable = true; # Python
          # pylsp.enable = true; # Python
          ruff.enable = true; # Python 
          nil_ls.enable = true; # Nix
          hyprls.enable = true; # Hyprlang
          dockerls.enable = true; # Docker
          jsonls.enable = true; # JSON
          eslint.enable = true; # Javascript
          cssls.enable = true; # CSS
          marksman.enable = true; # Markdown

          # Rust
          rust_analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
        };
      };
      
    };

    ######################
    ### NEOVIM OPTIONS ###
    ######################

    globals = {
      loaded_netrwPlugin = 1;
      loaded_netrw = 1; 
    };

    opts = {
      number = true; # Line Numbers
      relativenumber = true; # Relative Line Numbers
      clipboard = "unnamedplus"; # Use the system clipboard

      # Show tabline always
      showtabline = 2;

      # Use spaces instead of tabs
      expandtab = true;

      # Enable smart indentation
      smartindent = true;

      # Number of spaces to use for each step of (auto)indent
      shiftwidth = 2;

      # Enable break indent
      breakindent = true;

      # Highlight the screen line of the cursor
      cursorline = true;

      # Minimum number of screen lines to keep above and below the cursor
      scrolloff = 10;

      # Enable mouse support
      mouse = "a";

      # Set folding method to manual
      foldmethod = "manual";

      # Disable folding by default
      foldenable = false;

      # Wrap long lines at a character in 'breakat'
      linebreak = true;

      # Disable spell checking
      spell = false;

      # Disable swap file creation
      swapfile = false;

      # Time in milliseconds to wait for a mapped sequence to complete
      timeoutlen = 300;

      # Enable 24-bit RGB color in the TUI
      termguicolors = true;

      # Don't show mode in the command line
      showmode = false;

      # Open new split below the current window
      splitbelow = true;

      # Keep the screen when splitting
      splitkeep = "screen";

      # Open new split to the right of the current window
      splitright = true;

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
  
