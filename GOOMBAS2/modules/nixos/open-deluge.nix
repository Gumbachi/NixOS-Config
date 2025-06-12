{ ... }:
let
  cfg = "/mnt/main/Config/Deluge";
in
{

  # To achieve connectable status
  networking.firewall.allowedTCPPorts = [ 55380 ];
  networking.firewall.allowedUDPPorts = [ 55380 ];

  services.deluge = {
    enable = true;
    openFirewall = true;
    group = "media";
    web = {
      enable = true;
      openFirewall = true;
      port = 8111;
    };

    declarative = true; # Force config
    authFile = "/mnt/main/Config/Deluge/auth"; # File should be plaintext as user:pass:level

    # Find config here https://git.deluge-torrent.org/deluge/tree/deluge/core/preferencesmanager.py#n41
    config = {
      download_location = "/mnt/main/Config/Deluge/torrents";
      allow_remote = true;
      daemon_port = 58847;
      listen_ports = [ 6882 6890 ];
    };

  };

}
