{ ... }:
let
  port = 5055;
in
{

  services.caddy.virtualHosts."request.gumbachi.com" = {
    extraConfig = ''reverse_proxy localhost:${toString port}'';
    serverAliases = [ "jellyseerr.gumbachi.com" "jellyseer.gumbachi.com" ];
  };

  services.jellyseerr = {
    enable = true;
    port = port;
    # I cant get the below to function Readonly fs error
    # configDir = "/mnt/main/Config";
  };

}
