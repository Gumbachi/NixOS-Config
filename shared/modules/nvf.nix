{ ... }: {

  programs.nvf.enable = true;

  programs.nvf.settings.vim.theme = {
    enable = true;
    name = "catppuccin";
    style = "mocha";
  };

  # Vim Settings
  programs.nvf.settings.vim = {
    vimAlias = true;
    filetree.nvimTree.setupOpts.disable_netrw = true;
    # filetree.neo-tree.setupOpts.filesystem.hijack_netrw_behavior = "disabled";

    # Plugins
    lsp.enable = true;
    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    comments.comment-nvim.enable = true;
    autopairs.nvim-autopairs.enable = true;
    binds.whichKey.enable = true;
    ui.colorizer.enable = true;
    filetree.nvimTree.enable = true;

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

    # Plugins
    enableTreesitter = true;
    enableLSP = true;
    enableFormat = true;

    # Languages
    nix.enable = true;
    python.enable = true;
    markdown.enable = true;
    ts.enable = true;
  };

  programs.nvf.settings.vim.keymaps = [
    {
      key = "<leader>f";
      mode = "n";
      silent = true;
      action = ":Telescope find_files hidden=true<CR>";
    } 
  ];

}
