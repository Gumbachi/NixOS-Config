{ config, lib, ... }:
let
  cfg = config.services.jellyseerr;
  port = 5055;
in
{

  # Reverse Proxy Config
  services.caddy.virtualHosts."request.gumbachi.com" = lib.mkIf cfg.enable {
    extraConfig = ''reverse_proxy localhost:${toString port}'';
    serverAliases = [ "jellyseerr.gumbachi.com" "jellyseer.gumbachi.com" ];
  };

  services.jellyseerr = {
    port = port;
    # I cant get the below to function Readonly fs error
    # configDir = "/mnt/main/Config";
  };

}
