{ config, lib, ... }:
let
  cfg = config.services.immich;
  port = 2283;
in 
{

  users.users.immich.extraGroups = lib.mkIf cfg.enable [ "video" "render" "media" ];

  # Reverse proxy setup
  services.caddy.virtualHosts."photos.gumbachi.com" = lib.mkIf cfg.enable {
    extraConfig = ''reverse_proxy localhost:${toString port}'';
    serverAliases = [ "immich.gumbachi.com" ];
  };

  services.immich = {
    group = "media";
    port = port;
    mediaLocation = "/mnt/main/Media/Photos/Immich"; # Wouldnt touch this. It aint worth the hassle
    accelerationDevices = null;
  };

}
