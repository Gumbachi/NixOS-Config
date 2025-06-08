{ pkgs, ... }: {

  services = {

    bazarr = {
      enable = true;
      openFirewall = true;
      listenPort = 6767; # Bazarr gotta be different for some reason
      group = "media";
      dataDir = "/mnt/main/Config/Bazarr";
    };

    prowlarr = {
      enable = true;
      openFirewall = true;
      settings.server.port = 9696;
      dataDir = "/mnt/main/Config/Prowlarr";
    };

    radarr = {
      enable = true;
      openFirewall = true;
      settings.server.port = 7878;
      group = "media";
      dataDir = "/mnt/main/Config/Radarr";
    };

    sonarr = {
      enable = true;
      openFirewall = true;
      settings.server.port = 8989;
      group = "media";
      dataDir = "/mnt/main/Config/Sonarr";
    };

    readarr = {
      enable = true;
      openFirewall = true;
      settings.server.port = 8787;
      group = "media";
      dataDir = "/mnt/main/Config/Readarr";
    };

  };

}
