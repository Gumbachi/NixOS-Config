{ pkgs, ... }: {
  
  services = {

    # Automatic firmware updater
    fwupd.enable = true;

    # Media Control Service
    playerctld.enable = true;

    # Gnome Virtual File System - needed for AGS images
    gvfs.enable = true;

    # Media streaming server
    sunshine = {
      enable = true;
      autoStart = false;
      capSysAdmin = true;
      openFirewall = true;
    };

    openvpn.servers = {
      home = { config = '' config /home/jared/Downloads/client.conf ''; };
    };

    power-profiles-daemon.enable = true;

  };
}
