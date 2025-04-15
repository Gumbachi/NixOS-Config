{ ... }: {

  programs.nvf.enable = true; 

  programs.nvf.settings.vim.theme = {
    enable = true;
    name = "catppuccin";
    style = "mocha";
  };

  # Vim Settings
  programs.nvf.settings.vim = {
    # Plugins
    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    comments.comment-nvim.enable = true;     
  };

  # Languages
  programs.nvf.settings.vim.languages = {
    # Language Defaults
    enableTreesitter = true;
    enableLSP = true;
    enableFormat = true;

    # Languages
    nix.enable = true;
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
