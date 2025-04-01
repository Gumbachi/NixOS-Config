{ pkgs, lib, config, ...}: 
let
  cfg = config.emulation;
in
{

  options.emulation = {
    switch.ryubing.enable = lib.mkEnableOption "Enable switch emulation with Ryubing.";
    gba.mgba.enable = lib.mkEnableOption "Enable standalone mGBA emulator.";

    retroarch = {
      enable = lib.mkEnableOption "Enable Retroarch software with some basic cores.";
      extraCores = lib.mkOption {
        type = lib.types.list;
        default = [];
        description = "Extra cores to install with Retroarch.";
      };
    };

  };

  config = lib.mkMerge [

    # Switch Emulation // Ryubing
    (lib.mkIf cfg.switch.ryubing.enable {
      environment.systemPackages = [ pkgs.ryubing ];
    })

    # GBA Multiplayer emulation mGBA
    (lib.mkIf cfg.gba.mgba.enable {
      environment.systemPackages = [ pkgs.mgba ];
    })

    # Retroarch
    (lib.mkIf cfg.retroarch.enable {
      environment.systemPackages = [(
        pkgs.retroarch.withCores (cores: with cores; [
          melonds
          mgba
          citra
        ])
      )];
    })

  ];
}
