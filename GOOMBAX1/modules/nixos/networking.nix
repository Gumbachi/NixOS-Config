{ ... }: {

  networking.hostName = "GOOMBAX1";

  # Enable networking
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
  };

  networking.nftables.enable = true;

}
