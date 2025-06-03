{ config, lib, pkgs, ... }:
let
  inherit (lib) mkIf mkMerge mkEnableOption;
  module = "gaming";
  cfg = config.${module};
in {

  options.${module} = {
    # Minecraft
    minecraft.enable = mkEnableOption "Install Prism Launcher for Minecraft.";

    # VR
    vr.enable = mkEnableOption "Enable VR with ALVR.";

    # Steam
    steam = {
      enable = mkEnableOption "Install Steam.";
      forceDesktopScaling = mkEnableOption "Set an environment variable to force desktop scaling to 1.5x";
    };

    # Mangohud
    mangohud.enable = mkEnableOption "Install Mangohud.";

    # Gamescope
    gamescope.enable = mkEnableOption "Install gamescope.";

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
      home-manager.sharedModules = [{
        programs.mangohud.enable = true;
      }];
    })

    # Gamescope
    (mkIf cfg.gamescope.enable {
      programs.gamescope = {
        enable = true;
        capSysNice = true;
      };
      # programs.steam.enableGamescopeSession = true;
    })

    # ProtonUP
    (mkIf cfg.protonup.enable {
      environment.systemPackages = [pkgs.protonup-qt];
    })

    # Minecraft
    (mkIf cfg.minecraft.enable {
      environment.systemPackages = [pkgs.prismlauncher];
    })

    # VR
    (mkIf cfg.vr.enable {
      programs.alvr = {
        enable = true;
        openFirewall = true;
      };
    })
  ];
}
