{ pkgs, config, ... }: {

  stylix.enable = true;
  stylix.autoEnable = true;

  # Doesnt really work with hyprland just use hyprpaper
  stylix.image = ../../../images/wallpapers/plants.png;

  stylix.polarity = "dark";

  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/monokai.yaml";

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

  };

  stylix.targets = {
    # plymouth.enable = true;
    console.enable = true;
    # grub.enable = true;
    # gtk.enable = true;
    # qt.enable = true;
  };


  # Home Manager Options
  home-manager.sharedModules = [{

    stylix.cursor = {
      package = pkgs.catppuccin-cursors.mochaMauve;
      name = "catppuccin-mocha-mauve-cursors";
      size = 28;
    };

    stylix.targets = {
      qt.enable = true;
      mangohud.enable = true;
      firefox.enable = true;
      yazi.enable = true;
    };

    stylix.targets.gtk = {
      enable = true;
      extraCss = ''
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
    };

    # Add a stylix youtube music theme
    xdg.configFile."YouTube Music/stylix.css".text = '' 
      html:not(.style-scope)
      {
        --ctp-base: #${config.lib.stylix.colors.base00};
        --ctp-mantle: #${config.lib.stylix.colors.base01};
        --ctp-crust: #${config.lib.stylix.colors.base01};

        --ctp-surface0: #${config.lib.stylix.colors.base02};
        --ctp-surface1: #${config.lib.stylix.colors.base03};
        --ctp-surface2: #${config.lib.stylix.colors.base04};

        --ctp-text: #${config.lib.stylix.colors.base05};
        --ctp-subtext0: #${config.lib.stylix.colors.base05};
        --ctp-subtext1: #${config.lib.stylix.colors.base05};

        --ctp-rosewater: #${config.lib.stylix.colors.base06};
        --ctp-lavender: #${config.lib.stylix.colors.base07};
        --ctp-red: #${config.lib.stylix.colors.base08};
        --ctp-peach: #${config.lib.stylix.colors.base09};
        --ctp-yellow: #${config.lib.stylix.colors.base0A};
        --ctp-green: #${config.lib.stylix.colors.base0B};
        --ctp-teal: #${config.lib.stylix.colors.base0C};
        --ctp-blue: #${config.lib.stylix.colors.base0D};
        --ctp-mauve: #${config.lib.stylix.colors.base0E};
        --ctp-flamingo: #${config.lib.stylix.colors.base0F};

        --ctp-accent: var(--ctp-blue);

        --unthemed-yet: inherit !important;

        --yt-spec-commerce-filled-hover: var(--ctp-accent) !important;
      }
    '' + builtins.readFile ../../../shared/styles/youtube-music.css;

  }];
}
