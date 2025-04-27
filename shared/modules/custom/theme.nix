{ pkgs, config, lib, ... }:

with lib;

let
  cfg = config.theme;
in
{
 
  options.theme = {
    wallpaper = mkOption {
      type = lib.types.path;
      default = ../../../images/wallpapers/nix-gray.png;
    };
    monokai.enable = mkEnableOption "Enable the monokai theme using stylix.";
    catppuccin-mocha.enable = mkEnableOption "Enable the catppuccin mocha theme using stylix.";
  };

  config = mkMerge [

    # Theme Specific Settings
    (mkIf cfg.monokai.enable {
      stylix.enable = true;
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/monokai.yaml";
      stylix.polarity = "dark";
    })

    (mkIf cfg.catppuccin-mocha.enable {
      stylix.enable = true;
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
      stylix.polarity = "dark";
    })

    # Default Settings
    {
      stylix.autoEnable = true;
      stylix.image = cfg.wallpaper;

      stylix.fonts = {
        serif = {
          package = pkgs.inter;
          name = "Inter";
        };

        sansSerif = {
          package = pkgs.inter;
          name = "Inter";
        };

        monospace = {
          package = pkgs.nerd-fonts.blex-mono;
          name = "BlexMono Nerd Font";
        };

        sizes = {
          applications = 12;
          desktop = 10;
          popups = 8;
          terminal = 12;
        };

      };

      # Home Manager Options
      home-manager.sharedModules = [

        # Theme Specific Settings
        (mkIf cfg.monokai.enable {
          programs.vesktop.vencord.settings.plugins.ShikiCodeblocks.theme = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/refs/heads/main/packages/tm-themes/themes/monokai.json";
        })

        (mkIf cfg.catppuccin-mocha.enable {
          programs.vesktop.vencord.settings.plugins.ShikiCodeblocks.theme = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/refs/heads/main/packages/tm-themes/themes/catppuccin-mocha.json";
        })

        # Default home manager settings
        {

          # stylix.cursor = {
          #   package = pkgs.bibata-cursors;
          #   name = "Bibata-Modern-Ice";
          #   size = 24;
          # };

          stylix.targets.hyprland.enable = false;
          stylix.targets.cava.rainbow.enable = true;

          stylix.targets.gtk.extraCss = ''
            * button:focus {
              box-shadow: none; outline: none;
            }

            * { outline: none; }

            scale slider {
              border: 2px solid @accent_color;
              background-color: @theme_bg_color;
            }
            
            * scale:focus {
              outline: none;
              box-shadow: none;
              border: none;
            }
          '';

          # Add a stylix youtube music theme
          xdg.configFile."YouTube Music/stylix.css".text = with config.lib.stylix.colors; '' 
            html:not(.style-scope)
            {
              --ctp-base: #${base00};
              --ctp-mantle: #${base01};
              --ctp-crust: #${base01};

              --ctp-surface0: #${base02};
              --ctp-surface1: #${base03};
              --ctp-surface2: #${base04};

              --ctp-text: #${base05};
              --ctp-subtext0: #${base05};
              --ctp-subtext1: #${base05};

              --ctp-rosewater: #${base06};
              --ctp-lavender: #${base07};
              --ctp-red: #${base08};
              --ctp-peach: #${base09};
              --ctp-yellow: #${base0A};
              --ctp-green: #${base0B};
              --ctp-teal: #${base0C};
              --ctp-blue: #${base0D};
              --ctp-mauve: #${base0E};
              --ctp-flamingo: #${base0F};

              --ctp-accent: var(--ctp-blue);

              --unthemed-yet: inherit !important;

              --yt-spec-commerce-filled-hover: var(--ctp-accent) !important;
            }
          '' + builtins.readFile ../../../shared/styles/youtube-music.css;

        }
      ];
    } 
  ];

}
