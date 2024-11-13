{ ... }: {

  services.immich = {
    enable = true;
    openFirewall = true;
    host = "192.168.69.2";
    # machine-learning.enable = true;
  };

}
