{ config, ... }: {

  services.caddy = {
    enable = true;
    virtualHosts = {

      "localhost".extraConfig = ''
        respond "Hi there. Nothing in here yet"
      '';

      "howdy.gumbachi.com".extraConfig = ''respond "Howdy"'';

      # # Matrix
      # # "chat.gumbachi.com".extraConfig = '
      # #   reverse_proxy localhost:6167
      # # '';
      #
      # # Matrix
      # "chat.gumbachi.com".extraConfig = ''
      #   reverse_proxy /_matrix/* localhost:6167
      #   header /.well-known/matrix/* Content-Type application/json
      #   header /.well-known/matrix/* Access-Control-Allow-Origin *
      #   respond /.well-known/matrix/server `{"m.server": "chat.gumbachi.com:443"}`
      #   respond /.well-known/matrix/client `{"m.homeserver":{"base_url":"https://chat.gumbachi.com"}}`
      # '';

      # Immich
      "photos.gumbachi.com" = {
        extraConfig = ''reverse_proxy localhost:2283'';
        serverAliases = [ "immich.gumbachi.com" ];
      };

      # Calibre
      "read.gumbachi.com" = {
        extraConfig = ''reverse_proxy localhost:9292'';
        serverAliases = [ "calibre.gumbachi.com" ];
      };

      # Jellyfin
      "watch.gumbachi.com" = {
        extraConfig = ''reverse_proxy localhost:8096'';
        serverAliases = [ "jellyfin.gumbachi.com" ];
      };

      # Jellyseerr
      "request.gumbachi.com" = {
        extraConfig = ''reverse_proxy localhost:5055'';
        serverAliases = [ "jellyseerr.gumbachi.com" "jellyseer.gumbachi.com" ];
      };

      # Deluge
      "sail.gumbachi.com" = {
        extraConfig = ''reverse_proxy localhost:8112'';
        serverAliases = [ "deluge.gumbachi.com" ];
      };

      # Adguard Dashbaord
      "adguard.gumbachi.com".extraConfig = ''reverse_proxy localhost:3080'';

      # Prowlarr
      "prowlarr.gumbachi.com".extraConfig = ''reverse_proxy localhost:9696'';

      # Radarr
      "radarr.gumbachi.com".extraConfig = ''reverse_proxy localhost:7878'';

      # Sonarr
      "sonarr.gumbachi.com".extraConfig = ''reverse_proxy localhost:8989'';

      # Bazarr
      "bazarr.gumbachi.com".extraConfig = ''reverse_proxy localhost:6767'';
      
      # Readarr
      "readarr.gumbachi.com".extraConfig = ''reverse_proxy localhost:8787'';
    };
  };

  networking.firewall.allowedTCPPorts = [80 443];
}
