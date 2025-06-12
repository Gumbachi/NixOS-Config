{ ... }: {

  # Reverse Proxy
  services.caddy.virtualHosts."watch.gumbachi.com" = {
    extraConfig = ''reverse_proxy localhost:8096'';
    serverAliases = [ "jellyfin.gumbachi.com" ];
  };

  services.jellyfin = {
    enable = true;
    group = "media";
    configDir = "/mnt/main/Config/Jellyfin";
  };
 
}
