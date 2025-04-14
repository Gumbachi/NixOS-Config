{...}: {
  services.jellyfin = {
    enable = true;
    openFirewall = false;
    user = "jared";
    configDir = "/home/jared/B/Config/Jellyfin";
  };

  services.jellyseerr = {
    enable = true;
    openFirewall = false;
    # Below line causes jellyseerr to crash for some reason
    # configDir = "/home/jared/B/Config/Jellyseerr/";
  };
}
