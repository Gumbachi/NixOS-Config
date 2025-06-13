{ ... }:
let
  cfg = "/mnt/main/Config/Deluge";
  port = 8111;
in
{

  # Reverse Proxy
  services.caddy.virtualHosts."open-deluge.gumbachi.com" = {
    extraConfig = ''reverse_proxy localhost:8111'';
  };

  services.deluge = {
    enable = true;
    openFirewall = true;
    group = "media";
    web = {
      enable = true;
      openFirewall = true;
      port = port;
    };

    declarative = true; # Force config
    authFile = "${cfg}/auth"; # File should be plaintext as user:pass:level

    # Find config here https://git.deluge-torrent.org/deluge/tree/deluge/core/preferencesmanager.py#n41
    config = {
      download_location = "${cfg}/torrents";
      allow_remote = true;
      daemon_port = 58847;
      listen_ports = [ 6882 6890 ];
    };

  };

}
