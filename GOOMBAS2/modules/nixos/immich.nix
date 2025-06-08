{ ... }: {

  services.immich = {
    enable = true;
    group = "media";
    openFirewall = true;
    mediaLocation = "/mnt/main/Photos/Immich";
    accelerationDevices = null;
  };

  users.users.immich.extraGroups = [ "video" "render" "media" ];

}
