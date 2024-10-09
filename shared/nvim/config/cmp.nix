{
  #  plugins.cmp = {
  #    enable = true;
  #    settings.sources = [
  #      { name = "nvim_lsp"; }
  #      { name = "path"; }
  #      { name = "buffer"; }
  #    ];
  #  };

  plugins.coq-nvim = {
    enable = true;
    installArtifacts = true;
    settings = {
      auto_start = "shut-up";
    };
  };

}
