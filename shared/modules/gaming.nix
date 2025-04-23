{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.gaming;
in {

  # TODO: Add options for VR
  options.gaming = {
    # Minecraft
    minecraft.enable = mkEnableOption "Install Prism Launcher for Minecraft.";

    # Steam
    steam = {
      enable = mkEnableOption "Install Steam.";
      forceDesktopScaling = mkEnableOption "Set an environment variable to force desktop scaling to 1.5x";
    };

    # Mangohud
    mangohud = {
      enable = mkEnableOption "Install Mangohud.";
      config = mkOption {
        type = types.str;
        description = "Mangohud config environment variable.";
        default = "
          position=top-right,
          frame_timing=0,
          round_corners=10.0,
          frametime=0,
          hud_no_margin,
          background_alpha=0,
          table_columns=2
        ";
      };
    };

    # ProtonUP
    protonup.enable = mkEnableOption "Install proton version manager.";
  };

  config = mkMerge [

    # Steam
    (mkIf cfg.steam.enable {
      programs.steam.enable = true;
      environment.sessionVariables = mkIf cfg.steam.forceDesktopScaling {
        STEAM_FORCE_DESKTOPUI_SCALING = "1.5";
      };
    })

    # Mangohud
    (mkIf cfg.mangohud.enable {
      environment.systemPackages = [pkgs.mangohud];
      environment.sessionVariables.MANGOHUD_CONFIG = cfg.mangohud.config;
    })

    # ProtonUP
    (mkIf cfg.protonup.enable {
      environment.systemPackages = [pkgs.protonup-qt];
    })

    # Minecraft
    (mkIf cfg.minecraft.enable {
      environment.systemPackages = [pkgs.prismlauncher];
    })
  ];
}
