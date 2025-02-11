{ pkgs, ... }: {
  
  services = {

    # Automatic firmware updater
    fwupd.enable = false;

    # Media Control Service
    playerctld.enable = true;

    # Gnome Virtual File System - needed for AGS images
    gvfs.enable = true;

    syncthing = {
      enable = true;
      dataDir = "/home/jared/Sync";
      configDir = "/home/jared/.config/syncthing";
      user = "jared";
      group = "users";
    };

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
