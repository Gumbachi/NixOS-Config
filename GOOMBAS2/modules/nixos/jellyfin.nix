{...}: {
  services.jellyfin = {
    enable = true;
    openFirewall = false;
    group = "media";
    configDir = "/mnt/main/Config/Jellyfin";
    # configDir = "/mnt/main/Config/JellyfinAlt";
  };

  services.jellyseerr = {
    enable = true;
    port = 5055;
    openFirewall = false;
    # I cant get the below to function Readonly fs error
    # configDir = "/mnt/main/Config";
  };
}
