{ pkgs, config, lib, ... }:

with lib;

let
  cfg = config.documentation
in
{
  options.documentation = {
    tldr.enable = mkEnableOption "Enable TLDR for short documentation.";
    cheat.enable = mkEnableOption "Enable Cheat for short documentation.";
  }

  config = mkMerge [

    # TLDR
    (mkIf cfg.tldr.enable {
      environment.systemPackages = [ pkgs.tldr ];
    })

    # Cheat
    (mkIf cfg.cheat.enable {
      environment.systemPackages = [ pkgs.cheat ];
    })

  ];
}
