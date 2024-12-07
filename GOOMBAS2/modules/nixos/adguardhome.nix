{ ... }: {

  services.adguardhome = {
    enable = true;
    openFirewall = true;
    port = 3003;
  };

}
