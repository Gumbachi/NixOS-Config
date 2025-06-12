{ ... }:
let
  port = 8082;
in
{

  # Reverse proxy
  services.caddy.virtualHosts."dash.gumbachi.com" = {
    extraConfig = ''reverse_proxy localhost:${toString port}'';
    serverAliases = [ "dashboard.gumbachi.com" ];
  };

  services.homepage-dashboard = {
    enable = true;
    listenPort = port;
  };

}
