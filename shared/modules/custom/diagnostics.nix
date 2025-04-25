{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.diagnostics;
in
{

  options.diagnostics = {
    lact.enable = mkEnableOption "Enabled lact and the daemon.";
  };

  config = lib.mkMerge [
    (mkIf cfg.lact.enable {
      environment.systemPackages = [ pkgs.lact ];
      systemd.packages = [ pkgs.lact ];
      systemd.services.lactd.wantedBy = [ "multi-user.target" ];    
    })

  ];

}
