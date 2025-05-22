{pkgs, ...}: {
  programs.nvf.enable = false;

  programs.nvf.settings.vim.options = {
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
  };

  # Managed By Stylix
  # programs.nvf.settings.vim.theme = {
  #   enable = true;
  #   name = "catppuccin";
  #   style = "mocha";
  # };

  # Vim Settings
  programs.nvf.settings.vim = {
    useSystemClipboard = true;

    # Plugins
    statusline.lualine.enable = true;
    binds.whichKey.enable = true;
    ui.colorizer.enable = true;
    visuals.rainbow-delimiters.enable = true;
    dashboard.dashboard-nvim.enable = true;
    telescope.enable = true;

    treesitter = {
      enable = true;
    };

    autocomplete.nvim-cmp = {
      enable = true;
      mappings = {
        confirm = "<Tab>";
        next = "<Down>";
        previous = "<Up>";
      };
    };

    mini = {
      indentscope.enable = true;
      pairs.enable = true;
      comment.enable = true;
      surround.enable = true;
    };

    terminal.toggleterm = {
      enable = true;
      mappings.open = "<leader>t";
      setupOpts = {
        direction = "float";
        border = "curved";
      };
    };

    utility.yazi-nvim = {
      enable = true;
      mappings.openYazi = "<leader> ";
      # setupOpts.open_for_directories = true;
    };

    utility.preview.markdownPreview = {
      enable = true;
      autoStart = true;
    };

    projects.project-nvim = {
      enable = true;
      setupOpts = {
        show_hidden = true;
        manual_mode = false;
        patterns = [
          ".git"
          "_darcs"
          ".hg"
          ".bzr"
          ".svn"
          "Makefile"
          "package.json"
          "flake.nix"
          "cargo.toml"
        ];
      };
    };
  };

  programs.nvf.settings.vim.lsp = {
    enable = true;
    formatOnSave = true;
    null-ls.enable = true;
  };

  # Languages
  programs.nvf.settings.vim.languages = {
    # Language Defaults
    enableTreesitter = false;
    enableLSP = true;
    enableFormat = true;

    # Languages
    nix = {
      enable = true;
      format.enable = false;
      lsp.server = "nixd";
    };
    ts = {
      enable = true;
      format.type = "biome";
      format.enable = false;
    };
    python.enable = true;
    markdown.enable = true;
    css.enable = true;
    rust.enable = true;
    csharp.enable = true;
  };

  programs.nvf.settings.vim.keymaps = [
    {
      key = "<leader>f";
      mode = "n";
      silent = true;
      action = ":Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>";
    }
  ];

  programs.nvf.settings.vim.autocmds = [
    {
      desc = "4 Spacers";
      command = "setlocal shiftwidth=4 | setlocal tabstop=4";
      event = ["BufEnter"];
      pattern = [
        "*.py"
        "*.sass"
        "*.scss"
        "*.css"
      ];
    }
  ];
}
