{
  plugins.lsp = {
    enable = true;
    servers = {
      # basedpyright.enable = true; # Python
      # pylsp.enable = true; # Python
      ruff.enable = true; # Python 
      nil_ls.enable = true; # Nix
      hyprls.enable = true; # Hyprlang
      dockerls.enable = true; # Docker
      jsonls.enable = true; # JSON
      eslint.enable = true; # Javascript
      cssls.enable = true; # CSS
      marksman.enable = true; # Markdown
      # Rust
      rust_analyzer = {
        enable = true;
        installRustc = true;
        installCargo = true;
      };

    };
  };

  plugins.lsp-format.enable = true;
  plugins.lsp-status.enable = true;
  plugins.lsp-lines.enable = true;
}
