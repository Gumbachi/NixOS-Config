{
  # Import all your configuration modules here
  imports = [ 

    # NVIM stuff
    ./settings.nix
    ./keymaps.nix

    # Plugin configs
    ./plugins.nix
    ./lsp.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  colorschemes.catppuccin = {
    enable = true;
  };
  
}
