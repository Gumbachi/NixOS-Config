{ inputs, config, osConfig, pkgs, ... }:
let
  colors = if config.stylix.enable then with config.lib.stylix.colors.withHashtag; {
    text = base05;
    accent = base0D;
    highlight = base01;
  } else {
    text = "#cdd6f4";
    accent = "#89b4fa";
    highlight = "#cdd6f4";
  };
in
{

  imports = [ inputs.walker.homeManagerModules.default ];

  programs.walker = {
    enable = osConfig.launchers.walker.enable;
    runAsService = true;

    # All options from the config.json can be used here.
    config = {
      search.placeholder = "Example";
      ui.fullscreen = false;
      list = {
        height = 200;
      };
      websearch.prefix = "?";
      switcher.prefix = "/";
    };

    # If this is not set the default styling is used.
    # style = ''
    #   * {
    #     color: #dcd7ba;
    #   }
    # '';
  };

}
