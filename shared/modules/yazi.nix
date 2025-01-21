{ ... }: {
  programs.yazi = {
    enable = true;
    settings = {

      # Yazi.toml
      yazi = {
        manager = {
          show_hidden = false;
        };
      };

      # Theme.toml
      # theme = {
      #
      # };

    };
  };
}
