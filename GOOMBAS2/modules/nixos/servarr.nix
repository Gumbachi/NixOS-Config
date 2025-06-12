{ ... }:
let
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
    "prowlarr.gumbachi.com".extraConfig = ''reverse_proxy localhost:${toString ports.prowlarr}'';
    "radarr.gumbachi.com".extraConfig = ''reverse_proxy localhost:${toString ports.radarr}'';
    "sonarr.gumbachi.com".extraConfig = ''reverse_proxy localhost:${toString ports.sonarr}'';
    "bazarr.gumbachi.com".extraConfig = ''reverse_proxy localhost:${toString ports.bazarr}'';
  };

  services = {

    prowlarr = {
      enable = true;
      openFirewall = true;
      settings.server.port = ports.prowlarr;
      # This settings gets the DB to lock too often just hold off until nixified
      # dataDir = "/mnt/main/Config/Prowlarr";
    };

    radarr = {
      enable = true;
      openFirewall = true;
      settings.server.port = ports.radarr;
      group = "media";
      dataDir = "/mnt/main/Config/Radarr";
    };

    sonarr = {
      enable = true;
      openFirewall = true;
      settings.server.port = ports.sonarr;
      group = "media";
      dataDir = "/mnt/main/Config/Sonarr";
    };

    bazarr = {
      enable = true;
      openFirewall = true;
      listenPort = ports.bazarr; # Bazarr gotta be different for some reason
      group = "media";
      dataDir = "/mnt/main/Config/Bazarr";
    };

  };

}
