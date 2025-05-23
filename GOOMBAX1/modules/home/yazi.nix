{pkgs, ...}: {

  programs.yazi = {
    settings = {
      yazi = {
        manager.show_hidden = false;
        opener = {
          play = [
            {
              run = ''mpv "$@"'';
              orphan = true;
              for = "unix";
            }
          ];
          edit = [
            {
              run = ''$EDITOR "$@"'';
              block = true;
              for = "unix";
            }
          ];
          open = [
            {
              run = ''xdg-open "$@"'';
              desc = "Open";
            }
          ];
          unzip = [
            {
              run = ''unar -d "$0"'';
              block = true;
              desc = "Unzip";
            }
          ];
        };

        open = {
          prepend_rules = [
            {
              name = "*.zip";
              use = "unzip";
            }
          ];
        };
      };
    };
  };

}
