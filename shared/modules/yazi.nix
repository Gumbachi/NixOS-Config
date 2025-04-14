{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    # plugins = with pkgs.yaziPlugins; {
    #   sudo = sudo;
    #   chmod = chmod;
    # };
    settings = {
      # Keymap.toml
      # keymap = {
      #   manager.prepend_keymap = [
      #     {
      #       on = ["c" "m"];
      #       run = "plugin chmod";
      #       desc = "Chmod on selected files";
      #     }
      #     {
      #       on = ["R" "p"];
      #       run = "plugin sudo -- paste";
      #       desc = "Sudo paste";
      #     }
      #   ];
      # };
      # Yazi.toml
      yazi = {
        manager = {
          show_hidden = false;
        };

        opener = {
          play = [
            {
              run = ''env -u DISPLAY vlc "$@"'';
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
