{ ... }: {
  
  services.deluge = {
    enable = true;
    web = {
      enable = true;
      port = 8112;
      openFirewall = true;
    };
  };
}
