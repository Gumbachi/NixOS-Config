{ ... }: {
 
  # Syncthing
  networking.firewall.allowedTCPPorts = [ 8384 ];

  syncthing = {
    dataDir = "/home/jared/Sync";
    configDir = "/home/jared/.config/syncthing";
    user = "jared";
    group = "users";
    openDefaultPorts = true;      
    guiAddress = "0.0.0.0:8384";
    overrideDevices = true;
    settings = {
      devices.GOOMBAS2.id = "2VD6JZS-NF7AWWM-XZYU6Z2-TAZLQ3J-LEUUDBO-SSLYVXW-LA5JTEH-AO766A4";
      devices.GOOMBAM1.id = "RZWUQVJ-F3ETA27-2WNE7IF-Q5RIKRC-TU3BPKJ-V7RAX2F-IJYCEM2-PTB2XAY";
      devices.Go7.id = "GKNIIKZ-6P7TNMQ-X4FDQPI-75UH4O4-J664KC2-MVU3SVQ-BFYQL5V-4WC4WAF";

      folders."/home/jared/Sync/Notes" = {
        id = "notes";
        label = "Notes";
        devices = [ "GOOMBAS2" "GOOMBAM1" "Go7" ];
      };

      folders."/home/jared/Sync/Shared" = {
        id = "shared";
        label = "Shared Files";
        devices = [ "GOOMBAS2" "GOOMBAM1" "Go7" ];
      };

      folders."/home/jared/Sync/Torrents" = {
        id = "torrents";
        label = "Torrents";
        devices = [ "GOOMBAS2" ];
      };

      folders."/home/jared/Sync/Emulation/Saves" = {
        id = "emulation-saves";
        label = "Emulation Saves";
        devices = [ "GOOMBAS2" "GOOMBAM1" ];
      };

      folders."/home/jared/Sync/Emulation/Library" = {
        id = "emulation-library";
        label = "Emulation Library";
        devices = [ "GOOMBAS2" ];
      };
    };
  };

}
