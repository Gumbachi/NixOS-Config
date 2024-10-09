{
  plugins.lsp = {
    enable = true;
    servers = {
      pylsp.enable = true; # Python
      ruff.enable = true; # Python 
      nil-ls.enable = true; # Nix
      hyprls.enable = true; # Hyprlang
    };
  };

  plugins.lsp-format.enable = true;
  plugins.lsp-status.enable = true;
  plugins.lsp-lines.enable = true;
}
