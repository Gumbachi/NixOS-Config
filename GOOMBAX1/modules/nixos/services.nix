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
      guiAddress = "0.0.0.0:8384";
      overrideDevices = true;
      settings = {
        devices.GOOMBAS2.id = "2VD6JZS-NF7AWWM-XZYU6Z2-TAZLQ3J-LEUUDBO-SSLYVXW-LA5JTEH-AO766A4";
        devices.pixel.id = "RZWUQVJ-F3ETA27-2WNE7IF-Q5RIKRC-TU3BPKJ-V7RAX2F-IJYCEM2-PTB2XAY";
        devices.Go7.id = "GKNIIKZ-6P7TNMQ-X4FDQPI-75UH4O4-J664KC2-MVU3SVQ-BFYQL5V-4WC4WAF";

        folders."/home/jared/Sync/Notes" = {
          id = "notes";
          label = "Notes";
          devices = [ "GOOMBAS2" "pixel" "Go7" ];
        };

        folders."/home/jared/Sync/Shared" = {
          id = "shared";
          label = "Shared Files";
          devices = [ "GOOMBAS2" "pixel" "Go7" ];
        };

        folders."/home/jared/Sync/Torrents" = {
          id = "torrents";
          label = "Torrents";
          devices = [ "GOOMBAS2" ];
        };
      };
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
      clipse.enable = true;
    };
  }];

  # Syncthing
  networking.firewall.allowedTCPPorts = [ 8384 ];

}
