{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.networking;
in
{

  options.networking = {
    toolbox.enable = mkEnableOption "Enable common programs that allow for debug/dianostics.";
  };

  config = lib.mkMerge [

    (mkIf cfg.toolbox.enable {
      programs.traceroute.enable = true;
      environment.systemPackages = [ pkgs.dig ];
      programs.wireshark.enable = true;
      users.users.jared.extraGroups = [ "wireshark" ];
    })

  ];

}
