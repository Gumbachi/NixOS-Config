{ ... }: {

  services.adguardhome = {
    enable = true;
    allowDHCP = false;
    openFirewall = true;
  };

}
