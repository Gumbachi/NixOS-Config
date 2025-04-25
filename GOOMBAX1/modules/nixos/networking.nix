{ pkgs, ... }: {

  programs.traceroute.enable = true;

  environment.systemPackages = with pkgs; [
    dig
  ];

  networking.hostName = "GOOMBAX1";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

}
