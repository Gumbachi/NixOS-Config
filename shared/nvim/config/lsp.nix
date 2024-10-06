{
  plugins.lsp = {
    enable = true;
    servers = {
      ruff.enable = true; # Python 
      nil-ls.enable = true; # Nix
    };
  };

  plugins.lsp-format.enable = true;
  plugins.lsp-status.enable = true;
  plugins.lsp-lines.enable = true;
}
