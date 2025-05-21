{ config, lib, pkgs, ... }:
let
  inherit (lib) mkEnableOption mkMerge mkIf;
  cfg = config.diagnostics;
in
{

  options.diagnostics = {
    lact.enable = mkEnableOption "Enabled lact and the daemon.";
    btop.enable = mkEnableOption "Enable btop system monitor.";
    systemctl-tui.enable = mkEnableOption "Enable TUI for systemctl";
  };

  config = mkMerge [

    (mkIf cfg.lact.enable {
      environment.systemPackages = [ pkgs.lact ];
      systemd.packages = [ pkgs.lact ];
      systemd.services.lactd.wantedBy = [ "multi-user.target" ];    
    })

    (mkIf cfg.btop.enable {
      environment.systemPackages = [pkgs.btop];
      home-manager.sharedModules = [{ programs.btop.enable = true; }];
    })

    (mkIf cfg.systemctl-tui.enable {
      environment.systemPackages = [pkgs.systemctl-tui];
    })

  ];

}
