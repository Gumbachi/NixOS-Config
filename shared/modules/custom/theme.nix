{ pkgs, config, lib, ... }:
let
  inherit (lib) mkIf mkEnableOption mkOption;
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
    catppuccin-latte.enable = mkEnableOption "Enable the catppuccin latte theme using stylix.";
    sunset.enable = mkEnableOption "Enable my custom sunset theme using stylix.";
    woodland.enable = mkEnableOption "Enable the woodland theme using stylix.";
    zenbones.enable = mkEnableOption "Enable the zenbones theme using stylix.";
  };

  config = mkIf {
    # Default theme settings: applicable to all themes
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
  };
}
