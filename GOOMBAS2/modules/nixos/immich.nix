{ ... }: {

  services.immich = {
    enable = true;
    group = "media";
    openFirewall = true;
    mediaLocation = "/mnt/main/Media/Photos/Immich";
    accelerationDevices = null;
  };

  users.users.immich.extraGroups = [ "video" "render" "media" ];

}
