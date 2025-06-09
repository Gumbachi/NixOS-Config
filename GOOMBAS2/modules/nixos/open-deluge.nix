{ ... }:
let
  cfg = "/mnt/main/Config/Deluge";
in
{

  services.deluge = {
    enable = true;
    openFirewall = true;
    group = "media";
    dataDir = "${cfg}";
    web = {
      enable = true;
      openFirewall = true;
      port = 8111;
    };

    declarative = true; # Force config
    authFile = "${cfg}/auth"; # File should be plaintext as user:pass:level

    # Find config here https://git.deluge-torrent.org/deluge/tree/deluge/core/preferencesmanager.py#n41
    config = {
      download_location = "${cfg}/torrents";
      share_ratio_limit = "999.0";
      allow_remote = true;
      daemon_port = 58847;
      listen_ports = [ 6882 6890 ];
    };

  };

}
