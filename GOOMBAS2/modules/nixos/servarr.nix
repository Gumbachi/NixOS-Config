{ pkgs, ... }: {

  services = {
    prowlarr = {
      enable = true;
      openFirewall = true;
      settings.server.port = 9696;
    };

    radarr = {
      enable = true;
      openFirewall = true;
      settings.server.port = 7878;
      user = "jared";
      group = "users";

    };

    sonarr = {
      enable = true;
      openFirewall = true;
      settings.server.port = 8989;
      user = "jared";
      group = "users";
    };

  };

}
