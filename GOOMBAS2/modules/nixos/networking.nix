{ ... }: {

  networking.hostName = "GOOMBAS2";

  # Enable networking
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 
      8123 # No idead
      43002 # Sky Factory
      22000 # Syncthing
    ];
    allowedUDPPorts = [ 
      8123 # No clue
      43002 # Sky factory
      22000 21027 # Syncthing
    ];
  };

}
