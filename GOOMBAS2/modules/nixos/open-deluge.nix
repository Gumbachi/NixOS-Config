{ config, lib, ... }:
let
  cfg = config.services.deluge;
  dataDir = "/mnt/main/Config/Deluge";
  port = 8111;
in
{

  # Reverse Proxy
  services.caddy.virtualHosts."open-deluge.gumbachi.com" = lib.mkIf cfg.enable {
    extraConfig = ''reverse_proxy localhost:${toString port}'';
  };

  services.deluge = {
    openFirewall = true;
    group = "media";
    web = {
      enable = cfg.enable;
      openFirewall = true;
      port = port;
    };

    declarative = true; # Force config
    authFile = "${dataDir}/auth"; # File should be plaintext as user:pass:level

    # Find config here https://git.deluge-torrent.org/deluge/tree/deluge/core/preferencesmanager.py#n41
    config = {
      download_location = "${dataDir}/torrents";
      allow_remote = true;
      daemon_port = 58847;
      listen_ports = [ 6882 6890 ];
    };

  };

}
