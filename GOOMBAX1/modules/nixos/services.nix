{ pkgs, ... }: {
  
  services = {

    # Automatic firmware updater
    fwupd.enable = false;

    # Media Control Service
    playerctld.enable = true;

    # Gnome Virtual File System - needed for AGS images
    gvfs.enable = true;

    # Media streaming server
    sunshine = {
      enable = false;
      autoStart = false;
      capSysAdmin = true;
      openFirewall = true;
    };

    power-profiles-daemon.enable = true;

  };
}
