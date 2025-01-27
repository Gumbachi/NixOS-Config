{ pkgs, ... }: {

  programs.nvf.enable = true;

  # programs.nvf.settings.vim.globals = {
  #   directory = "~/.nvim/swap//";
  #   backupdir = "~/.nvim/backup//";
  # };

  # programs.nvf.settings.vim.options = {
  #   backup = false;
  # };

  programs.nvf.settings.vim.theme = {
    enable = true;
    name = "catppuccin";
    style = "mocha";
  };

  # Vim Settings
  programs.nvf.settings.vim = {
    vimAlias = true;

    # Plugins
    lsp.enable = true;
    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    comments.comment-nvim.enable = true;
    autopairs.nvim-autopairs.enable = true;
    binds.whichKey.enable = true;
    ui.colorizer.enable = true;
    visuals.rainbow-delimiters.enable = true;
    dashboard.dashboard-nvim.enable = true;
    mini.indentscope.enable = true;
        

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

  # Languages
  programs.nvf.settings.vim.languages = {
    # Language Defaults
    enableTreesitter = false;
    enableLSP = true;
    enableFormat = true;

    # Languages
    nix.enable = true;
    python.enable = true;
    markdown.enable = true;
    ts.enable = true;
    css.enable = true;
  };

  programs.nvf.settings.vim.keymaps = [
    {
      key = "<leader>f";
      mode = "n";
      silent = true;
      action = ":Telescope find_files hidden=true<CR>";
    }
  ];

  # Extra Plugins
  programs.nvf.settings.vim.lazy.plugins = {
    "yazi.nvim" = {
     package = pkgs.vimPlugins.yazi-nvim;
      setupModule = "yazi";
      setupOpts = {
        option_name = true;
      };

      # Explicitly mark plugin as lazy. You don't need this if you define one of
      # the trigger "events" below
      lazy = true;

      # load on command
      cmd = ["Yazi"];

      # load on event
      event = ["BufEnter"];

      # load on keymap
      keys = [
        {
          key = "<leader>e";
          action = ":Yazi<CR>";
          mode = "n";
        }
      ];
    };
  };
}
