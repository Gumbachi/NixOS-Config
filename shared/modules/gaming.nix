{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.gaming;
in {
  # TODO: Add options for VR
  options.gaming = {
    # Minecraft
    minecraft.enable = lib.mkEnableOption "Install Prism Launcher for Minecraft.";

    # Steam
    steam.enable = lib.mkEnableOption "Install Steam.";

    # Mangohud
    mangohud = {
      enable = lib.mkEnableOption "Install Mangohud.";
      config = lib.mkOption {
        default = "
          position=top-right,
          frame_timing=0,
          round_corners=10.0,
          frametime=0,
          hud_no_margin,
          background_alpha=0,
          table_columns=2
        ";
        type = lib.types.string;
        description = "Mangohud config environment variable.";
      };
    };

    # ProtonUP
    protonup.enable = lib.mkEnableOption "Install proton version manager.";
  };

  config = lib.mkMerge [
    # Steam
    (lib.mkIf cfg.steam.enable {programs.steam.enable = true;})

    # Mangohud
    (lib.mkIf cfg.mangohud.enable {
      environment.systemPackages = [pkgs.mangohud];
      environment.sessionVariables.MANGOHUD_CONFIG = cfg.mangohud.config;
    })

    # ProtonUP
    (lib.mkIf cfg.protonup.enable {
      environment.systemPackages = [pkgs.protonup-qt];
    })

    # Minecraft
    (lib.mkIf cfg.minecraft.enable {
      environment.systemPackages = [pkgs.prismlauncher];
    })
  ];
}
