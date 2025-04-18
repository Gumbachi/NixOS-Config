{ pkgs, ... }: {

  programs.traceroute.enable = true;

  environment.systemPackages = with pkgs; [
    dig
  ];

  networking.hostName = "GOOMBAX1";

  # Enable networking
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    # allowedTCPPorts = [ 25565 ];
    # allowedTCPPortRanges = [
    #   { from = 42999; to = 43001; } 
    # ];
    # allowedUDPPorts = [ 25565 ];
    # allowedUDPPortRanges = [
    #   { from = 42999; to = 43001; } 
    # ];
  };


}
