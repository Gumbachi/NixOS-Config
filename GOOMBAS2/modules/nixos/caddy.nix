{ config, ... }: {

  services.caddy = {
    enable = true;
    virtualHosts = {
      "gumbachi.com".extraConfig = ''
        respond "Hi there. Nothing in here yet"
      '';

      # Matrix
      # "chat.gumbachi.com".extraConfig = ''
      #   reverse_proxy localhost:6167
      # '';

      # Matrix
      "chat.gumbachi.com".extraConfig = ''
        reverse_proxy /_matrix/* localhost:6167
        header /.well-known/matrix/* Content-Type application/json
        header /.well-known/matrix/* Access-Control-Allow-Origin *
        respond /.well-known/matrix/server `{"m.server": "chat.gumbachi.com:443"}`
        respond /.well-known/matrix/client `{"m.homeserver":{"base_url":"https://chat.gumbachi.com"}}`
      '';

      # Immich
      "photos.gumbachi.com" = {
        extraConfig = ''reverse_proxy localhost:2283'';
        serverAliases = [ "immich.gumbachi.com" ];
      };

      # Jellyfin
      "watch.gumbachi.com" = {
        extraConfig = ''reverse_proxy localhost:8096'';
        serverAliases = [ "jellyfin.gumbachi.com" ];
      };

      # Jellyseerr
      "request.gumbachi.com" = {
        extraConfig = ''reverse_proxy localhost:${toString config.services.jellyseerr.port}'';
        serverAliases = [ "jellyseerr.gumbachi.com" "jellyseer.gumbachi.com" ];
      };

      # Prowlarr
      "prowlarr.gumbachi.com".extraConfig = ''
        reverse_proxy http://127.0.0.1:9696
      '';

      # Radarr
      "radarr.gumbachi.com".extraConfig = ''
        reverse_proxy localhost:${toString config.services.radarr.settings.server.port}/radarr
      '';

      # Sonarr
      "sonarr.gumbachi.com".extraConfig = ''
        reverse_proxy localhost:${toString config.services.sonarr.settings.server.port}/sonarr
      '';


      # "sync.gumbachi.com".extraConfig = ''
      #   reverse_proxy localhost:8384
      # '';

      # "home.gumbachi.com".extraConfig = ''
      #   reverse_proxy 192.168.69.2:8123
      # '';
    };
  };

  networking.firewall.allowedTCPPorts = [80 443];
}
