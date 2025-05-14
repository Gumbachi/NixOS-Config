{ pkgs, config, lib, ... }:

with lib;

let
  cfg = config.theme;
in
{

  imports = [ 
    ../../styles/patch.nix # Nix file for patching css
    ../../themes # Import theme modifications 
  ];  
  options.theme = {
    wallpaper = mkOption {
      type = lib.types.path;
      default = ../../../images/wallpapers/nix-gray.png;
    };
    monokai.enable = mkEnableOption "Enable the monokai theme using stylix.";
    catppuccin-mocha.enable = mkEnableOption "Enable the catppuccin mocha theme using stylix.";
  };

  config = mkMerge [

    # # Theme Specific Settings
    # (mkIf cfg.monokai.enable {
    #   stylix.enable = true;
    #   stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/monokai.yaml";
    #   stylix.polarity = "dark";
    #   theme.wallpaper = mkDefault ../../../images/wallpapers/monokai.png;
    #   home-manager.sharedModules = [{
    #     programs.vesktop.vencord.settings.plugins.ShikiCodeblocks.theme = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/refs/heads/main/packages/tm-themes/themes/monokai.json";       
    #     wayland.windowManager.hyprland.settings.env = [ "HYPRCURSOR_THEME,Bibata-Modern-Ice" ];
    #     home.pointerCursor = {
    #       package = pkgs.bibata-cursors;
    #       name = "Bibata-Modern-Ice";
    #     };
    #   }];
    # })


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
          applications = 11;
          desktop = 10;
          popups = 8;
          terminal = 12;
        };

      };

      # Home Manager Options
      home-manager.sharedModules = [{

        # Enable cursor theming
        home.pointerCursor = {
          enable = true;
          size = 24;
          gtk.enable = true;
          hyprcursor.size = 32;
          hyprcursor.enable = true;
        };

        stylix.targets.cava.rainbow.enable = true;

        stylix.targets.floorp = {
          colorTheme.enable = true;
          profileNames = [ "default" ];
        };

      }];
    } 
  ];

}
