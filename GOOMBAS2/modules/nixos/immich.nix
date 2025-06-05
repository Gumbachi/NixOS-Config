{ ... }: {

  services.immich = {
    enable = true;
    openFirewall = true;
    user = "jared";
    group = "users";
    mediaLocation = /home/jared/B/Photos;
    accelerationDevices = null;
  };

}
