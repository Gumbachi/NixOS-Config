{ ... }: {
  programs.yazi = {
    enable = true;
    settings = {

      # Yazi.toml
      yazi = {
        manager = {
          show_hidden = false;
        };

        opener = {
          play = [
	          { run = ''env -u DISPLAY vlc "$@"''; orphan = true; for = "unix"; }
          ];
        };

        open = {
          rules = [
            { mime = "video/*"; use = [ "play" "reveal" ]; }
          ];
        };
      };

      # Theme.toml
      # theme = {
      #
      # };

    };
  };
}
