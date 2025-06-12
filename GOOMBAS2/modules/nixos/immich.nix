{ ... }:
let
  port = 2283;
in 
{

  users.users.immich.extraGroups = [ "video" "render" "media" ];

  # Reverse proxy setup
  services.caddy.virtualHosts."photos.gumbachi.com" = {
    extraConfig = ''reverse_proxy localhost:${toString port}'';
    serverAliases = [ "immich.gumbachi.com" ];
  };

  services.immich = {
    enable = true;
    group = "media";
    port = port;
    openFirewall = false;
    mediaLocation = "/mnt/main/Media/Photos/Immich"; # Wouldnt touch this. It aint worth the hassle
    accelerationDevices = null;
  };

}
