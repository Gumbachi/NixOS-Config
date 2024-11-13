{ ... }: {
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;
    
    #######################
    ### PLUGINS AND LSP ###
    #######################

    plugins = {
      web-devicons.enable = true;
      yazi.enable = true; # File Management
      lualine.enable = true; # Status Line
      which-key.enable = true; # Input Hints
      rainbow-delimiters.enable = true; # Rainbow Brackets
      markview.enable = true; # Markdown Preview
      markdown-preview.enable = true; # Alternate Markdown Preview 
      comment.enable = true; # Enable easy commenting
      nvim-colorizer.enable = true; # Highlight Hexcodes

      indent-blankline = {
        enable = true;
        settings.scope.enabled = false;
      };

      toggleterm = {
        enable = true;
        settings = {
          direction = "float";
          float_opts = {
            border = "curved";
            height = 30;
            width = 130;
          };
          open_mapping = "[[<c-/>]]";
        }; 
      };
 
      # nvim-autopairs.enable = true;
      autoclose = {
        enable = true;
        options.pairSpaces = true;
        options.autoIndent = true;
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
      
      # Treesitter
      treesitter = {
        enable = true;
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
      lsp-signature.enable = true;
      lsp = {
        enable = true;
        servers = {
          ts_ls.enable = true; # Typescript/Javascript
          pyright.enable = true; # Python
          nil_ls.enable = true; # Nix
          dockerls.enable = true; # Docker
          jsonls.enable = true; # JSON
          cssls.enable = true; # CSS
          marksman.enable = true; # Markdown

          hyprls = {
            enable = true;
            filetypes = [ "conf" ];
          }; # Hyprlang

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

      # Use spaces instead of tabs
      expandtab = true;
      shiftwidth = 2;
      softtabstop = 2;

      # Enable smart indentation
      cindent = true;

      # Keep wrapped lines on the same indent
      breakindent = false; # Re-enable this

      # Highlight the screen line of the cursor
      cursorline = true;

      # Minimum number of screen lines to keep above and below the cursor
      scrolloff = 8;

      # Enable mouse support
      mouse = "a";

      # Set folding method to indent
      foldmethod = "manual";

      # Disable folding by default
      # foldenable = false;

      # Wrap long lines at a character in 'breakat'
      linebreak = true;

      # Disable swap file creation
      swapfile = false;

      # Time in milliseconds to wait for a mapped sequence to complete
      # timeoutlen = 300;

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

      # Ignore case when searching unless uppercase is present
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
        key = "<leader>f";
        action = "<CMD>Telescope find_files hidden=true<CR>";
        options.desc = "Open Telescope";
      }
      {
        key = "<leader>l";
        action = "<CMD>lua vim.lsp.buf.format()<CR>";
        options.desc = "Format the current buffer";
      }
      {
        key = "<leader>e";
        action = "<CMD>Yazi<CR>";
        options.desc = "Open Yazi";
      } 
      {
        key = "<leader>md";
        action = "<CMD>Markview<CR>"; # MarkdownPreview
        options.desc = "Open the markdown preview";
      }
    ];

   
  };
}
  
