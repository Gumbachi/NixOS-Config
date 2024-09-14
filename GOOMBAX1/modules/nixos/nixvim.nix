{ ... }: {

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;

    plugins = {
      lualine.enable = true;
      dashboard.enable = true;
      neoscroll.enable = true;
      nvim-tree.enable = true;
      treesitter.enable = true;
      coq-nvim.enable = true;
      lsp.enable = true;
      telescope = {
        enable = true;
        extensions = {
            
        };
      };
    };
    
  };



  
}
