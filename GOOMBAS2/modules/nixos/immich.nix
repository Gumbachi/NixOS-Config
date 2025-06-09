{ ... }: {

  services.immich = {
    enable = true;
    group = "media";
    openFirewall = false;
    mediaLocation = "/mnt/main/Media/Photos/Immich"; # Wouldnt touch this. It aint worth the hassle
    accelerationDevices = null;
  };

  users.users.immich.extraGroups = [ "video" "render" "media" ];

}
