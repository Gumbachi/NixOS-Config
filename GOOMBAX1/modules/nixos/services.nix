{ ... }: {
  
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
      # settings = {
      #   output_name = 2;
      #   upnp = "on";
      # };
    };

    power-profiles-daemon.enable = true;

  };
}
