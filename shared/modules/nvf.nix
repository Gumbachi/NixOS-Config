{ ... }: {

  programs.nvf.enable = true;

  programs.nvf.settings.vim.theme = {
    enable = true;
    name = "catppuccin";
    style = "darker";
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
    projects.project-nvim.enable = true;

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

}
