{ ... }: {
  
  services = {

    # Printing
    printing.enable = true;

    openssh.enable = true;

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
      openDefaultPorts = true;
    };


    # Media streaming server
    sunshine = {
      enable = false;
      autoStart = false;
      capSysAdmin = true;
      openFirewall = true;
    };

    power-profiles-daemon.enable = true;

    smartd.enable = false;

    # Helps speed up boot
    journald.extraConfig = ''
      Storage=volatile
      SystemMaxFileSize=50M
    '';

  };

  # Home manager programs
  home-manager.sharedModules = [{
    services = {
      hypridle.enable = true;
      hyprpaper.enable = true;
      hyprpolkitagent.enable = true;
    };
  }];

  # Syncthing
  networking.firewall.allowedTCPPorts = [ 8384 ];

}
