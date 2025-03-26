{ config, lib, pkgs, ...}: 
let 
  gcfg = config.gaming; 
  ecfg = config.emulation;
in {

  options = { 

    emulation = {
      switch.ryubing.enable = lib.mkEnableOption "Enable switch emulation with Ryubing.";

      retroarch = {
        enable = lib.mkEnableOption "Enable Retroarch software with some basic cores.";
        extraCores = lib.mkOption {
          type = lib.types.list;
          default = [];
          description = "Extra cores to install with Retroarch.";
        };
      };

      gba.mgba.enable = lib.mkEnableOption "Enable standalone mGBA emulator.";
    };

    gaming = { 
      
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
  };

  config = {
    programs.steam.enable = lib.mkIf gcfg.steam.enable;

    environment.systemPackages = [
      lib.mkIf gcfg.mangohud.enable pkgs.mangohud
      lib.mkIf gcfg.protonup.enable pkgs.protonup-qt
      lib.mkIf gcfg.minecraft.enable pkgs.prismlauncher

      lib.mkIf ecfg.switch.ryubing.enable pkgs.ryubing
      lib.mkIf ecfg.gba.mgba.enable pkgs.mgba

      lib.mkIf ecfg.retroarch.enable (
        pkgs.retroarch.withCores (cores: with cores; [
          melonds
          mgba
          citra
        ])
      )
    ];

    environment.sessionVariables = lib.mkIf gcfg.mangohud.enable {
      MANGOHUD_CONFIG = gcfg.mangohud.config;
    };

  };

}
