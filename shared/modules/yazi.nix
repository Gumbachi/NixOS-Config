{ ... }: {
  programs.yazi = {
    enable = true;
    settings = {

      # Yazi.toml
      yazi = {
        manager = {
          show_hidden = true;
        };
      };

      # Theme.toml
      # theme = {
      #
      # };

    };
  };
}
