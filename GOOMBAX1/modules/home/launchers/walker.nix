{ inputs, config, osConfig, ... }:
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
      app_launch_prefix = if osConfig.programs.uwsm.enable then "uwsm app -- " else "";
      
      ui.fullscreen = false;
      list = {
        height = 300;
      };

      activation_mode.disabled = true;

      builtins.applications.actions = {
        enabled = false;
      };

      builtins.runner = {
        prefix = ":r ";
        hidden = true;
      };

      builtins.websearch = {
        prefix = ":s ";
        hidden = true;
      };

      builtins.windows = {
        prefix = ":w ";
        hidden = true;
      };

      builtins.translation = {
        prefix = ":t ";
        hidden = true;
        provider = "googlefree";
      };

      builtins.clipboard = {
        prefix = ":c ";
        hidden = true;
      };

      builtins.emojis = {
        prefix = ":e ";
        hidden = true;
      };

    };

    # If this is not set the default styling is used.
    # style = ''
    #   * {
    #     color: #dcd7ba;
    #   }
    # '';
  };

}
