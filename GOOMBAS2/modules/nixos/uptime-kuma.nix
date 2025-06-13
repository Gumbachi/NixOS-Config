{ config, lib, ... }:
let
  inherit (lib) mkIf;
  cfg = config.services.uptime-kuma;
  dashboard-cfg = config.services.homepage-dashboard;
  host = "127.0.0.1";
  port = "3180";
  url = "uptime.gumbachi.com";
in
{

  services.uptime-kuma = {
    settings = {
      HOST = host;
      PORT = port;
      DATA_DIR = "/mnt/main/config/uptime-kuma";
    };
  };

  # Reverse Proxy
  services.caddy.virtualHosts.${url} = mkIf cfg.enable { 
    extraConfig = ''reverse_proxy ${host}:${port}'';
  };

  # Homepage Dashboard Service
  services.homepage-dashboard.services = mkIf dashboard-cfg.enable [{
    "Other" = [{
      "Uptime" = {
        icon = "uptime-kuma.png";
        description = "Uptime Stats";
        href = "https://${url}";
        siteMonitor = "https://${url}";
      };
    }];
  }];

}
