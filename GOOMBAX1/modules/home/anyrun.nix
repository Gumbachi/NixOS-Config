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

  programs.anyrun = {
    enable = osConfig.launchers.anyrun.enable;
    config = {
      x = { fraction = 0.5; };
      y = { fraction = 0.3; };
      width = { fraction = 0.3; };
      hideIcons = false;
      # ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = true;
      closeOnClick = false;
      showResultsImmediately = true;
      maxEntries = null;

      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        symbols
        rink # Calc
        dictionary
        websearch
        shell
      ]; 
    };

    extraCss = /*css */ ''
      #window {
        background-color: rgba(0, 0, 0, 0);
      }

      box#main {
        border-radius: 10px;
        border: 4px solid ${colors.accent};
      }

      entry#entry {
        min-height: 60px;
        border-radius: 10px;
        font-size: 1.5em;
        font-weight: bold;
        background: transparent;
        box-shadow: none;
        border: none;
      }

      list#main {
        background-color: rgba(0, 0, 0, 0);
      }

      #plugin {
        background: transparent;
        padding-bottom: 5px;
      }

      #match {
        padding: 2.5px;
      }

      #match:selected {
        background: transparent;
        border-radius: 4px;
        color: ${colors.accent};
      }

      #match:selected label#info {
        color: ${colors.highlight};
        animation: fade 0.1s linear
      }

      @keyframes fade {
        0% {
          color: transparent;
        }

        100% {
          color: ${colors.highlight};
        }
      }

      #match label#info {
        color: transparent;
      }

      #match:hover {
        background: transparent;
      }

      label#match-desc {
        font-size: 10px;
        color: ${colors.highlight};
      }

      label#plugin {
        font-size: 14px;
      }
    '';

    extraConfigFiles = {
      "symbols.ron".text = ''
        Config(
          prefix: ":s",
          symbols: {
            "shrug": "¯\\_(ツ)_/¯",
          },
          max_entries: 3,
        )
      '';

      "translate.ron".text = ''
        Config(
          prefix: ":t",
          language_delimiter: ">",
          max_entries: 3,
        )
      '';

      "websearch.ron".text = ''
        Config(
          prefix: ":w",
          engines: [Google],
        )
      '';

      "shell.ron".text = ''
        Config(
          prefix: ":c",
          shell: None,
        )
      '';

      "rink.ron".text = ''
        Config(
          prefix: ":r",
        )
      '';
    };

  };

}
