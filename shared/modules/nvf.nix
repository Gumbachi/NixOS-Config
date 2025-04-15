{pkgs, ...}: {
  programs.nvf.enable = true;

  programs.nvf.settings.vim.options = {
    tabstop = 4;
    shiftwidth = 4;
    expandtab = true;
  };

  programs.nvf.settings.vim.theme = {
    enable = true;
    name = "catppuccin";
    style = "mocha";
  };

  # Vim Settings
  programs.nvf.settings.vim = {
    useSystemClipboard = true;

    # Plugins
    statusline.lualine.enable = true;
    autocomplete.nvim-cmp.enable = true;
    comments.comment-nvim.enable = true;
    autopairs.nvim-autopairs.enable = true;
    binds.whichKey.enable = true;
    ui.colorizer.enable = true;
    visuals.rainbow-delimiters.enable = true;
    dashboard.dashboard-nvim.enable = true;
    mini.indentscope.enable = true;

    telescope = {
      enable = true;
      setupOpts = {
        defaults = {
          # path_display = ["absolute" "smart"];
          hidden = true;
        };
      };
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
    enableTreesitter = true;
    enableLSP = true;
    enableFormat = true;

    # Languages
    nix = {
      enable = true;
      format.enable = false;
      lsp.server = "nixd";
    };
    python.enable = true;
    markdown.enable = true;
    ts.enable = true;
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
      desc = "2 Spacers";
      command = "setlocal shiftwidth=2 | setlocal tabstop=2";
      event = ["BufEnter"];
      pattern = [
        "*.nix"
      ];
    }
  ];
}
