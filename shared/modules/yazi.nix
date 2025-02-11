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
          edit = [
	          { run = ''$EDITOR "$@"''; block = true; for = "unix"; }
          ];
          open = [
            { run = ''xdg-open "$@"''; desc = "Open"; }
          ];
        };

        # open = {
        #   rules = [
        #     { mime = "video/*"; use = [ "play" "reveal" ]; }
        #   ];
        # };
      };

      # Theme.toml
      # theme = {
      #
      # };

    };
  };
}
