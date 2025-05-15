{ pkgs, lib, config, ... }:
let
  inherit (lib) mkIf mkDefault;
  cfg = config.theme.steam;
  # shikiThemes = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/refs/heads/main/packages/tm-themes/themes";
in
{
  config = mkIf cfg.enable {

    # Set Stylix theme
    stylix = {
      enable = true;
      base16Scheme = {
        scheme = "Steam";

        # Background colors
        base00 = "#24282F"; # default background
        base01 = "#171D25"; # status bar color
        base02 = "#3E4E69"; # selection background
        base03 = "#60686E"; # comments/invisibles

        base04 = "#67707B"; # Dark foreground for status bars
        base05 = "#DCDEDF"; # Default foreground / Text

        base06 = "#A5A6AA"; # Light foreground // rosewater
        base07 = "#3D4450"; # Light backgreund // lavender

        # Main Colors
        base08 = "#DF2A4B"; # red
        base09 = "#C37F00"; # peach

        base0A = "#FFC82C"; # yellow
        base0B = "#59BF40"; # green

        base0C = "#94e2d5"; # teal
        base0D = "#1A9FFF"; # blue # Primary Accent

        base0E = "#AD66BB"; # mauve # Alternate Accent

        base0F = "#F27499"; # flamingo
      };
      polarity = "dark"; 
    };

    # Set a default wallpaper
    # theme.wallpaper = mkDefault ../../images/wallpapers/bisbiswas05.jpg;

    # Set home manager configurations
    home-manager.sharedModules = [{
      
      # Theme code blocks in vencord
      # programs.vesktop.vencord.settings.plugins.ShikiCodeblocks.theme = "${shikiThemes}/monokai.json";        

      # Set XCursor
      home.pointerCursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
      };

      # Set Hyprcursor theme
      wayland.windowManager.hyprland.settings.env = [ "HYPRCURSOR_THEME,Bibata-Modern-Ice" ];

    }];
  };
}
