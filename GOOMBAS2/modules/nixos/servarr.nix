{ config, lib, ... }:
let
  cfg = config.services;
  ports = {
    bazarr = 6767;
    prowlarr = 9696;
    radarr = 7878;
    sonarr = 8989;
  };
in
{

  # Reverse Proxy
  services.caddy.virtualHosts = {
    "prowlarr.gumbachi.com".extraConfig = 
      lib.mkIf cfg.prowlarr.enable ''reverse_proxy localhost:${toString ports.prowlarr}'';
    "sonarr.gumbachi.com".extraConfig = 
      lib.mkIf cfg.sonarr.enable ''reverse_proxy localhost:${toString ports.sonarr}'';
    "bazarr.gumbachi.com".extraConfig = 
      lib.mkIf cfg.bazarr.enable ''reverse_proxy localhost:${toString ports.bazarr}'';
    "radarr.gumbachi.com".extraConfig = 
      lib.mkIf cfg.radarr.enable ''reverse_proxy localhost:${toString ports.radarr}'';
  };

  services = {

    prowlarr = {
      settings.server.port = ports.prowlarr;
      # This settings gets the DB to lock too often just hold off until nixified
      # dataDir = "/mnt/main/Config/Prowlarr";
    };

    radarr = {
      settings.server.port = ports.radarr;
      group = "media";
      dataDir = "/mnt/main/Config/Radarr";
    };

    sonarr = {
      settings.server.port = ports.sonarr;
      group = "media";
      dataDir = "/mnt/main/Config/Sonarr";
    };

    bazarr = {
      listenPort = ports.bazarr; # Bazarr gotta be different for some reason
      group = "media";
      dataDir = "/mnt/main/Config/Bazarr";
    };

  };

}
