{ config, lib, ... }:
let
  cfg = config.services.caddy;
in
{

  networking.firewall.allowedTCPPorts = lib.mkIf cfg.enable [ 80 443 ];

  services.caddy = {
    # globalConfig = ''
    #   auto_https disable_redirects
    # '';
    virtualHosts = {

      "gumbachi.com".extraConfig = ''respond "Howdy"'';

      # Deluge - VPN
      "sail.gumbachi.com" = {
        extraConfig = ''reverse_proxy localhost:8112'';
        serverAliases = [ "deluge.gumbachi.com" ];
      };

      # ! README !
      #
      # Most caddy configuration is found in the services respective module
      # in hostname/modules/nixos/

    };
  };

}
