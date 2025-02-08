{ ... }: {

  networking.hostName = "GOOMBAS2";

  # Enable networking
  networking.networkmanager.enable = true;

  networking.enableIPv6 = false;

  networking.firewall = {
    enable = true;
    # allowedTCPPorts = [];
    # allowedTCPPortRanges = [
    #   { from = 42999; to = 43001; } 
    # ];
    # allowedUDPPorts = [ 25565 3003 ];
    # allowedUDPPortRanges = [
    #   { from = 42999; to = 43001; } 
    # ];
  };

  networking.nftables.enable = false;

}
