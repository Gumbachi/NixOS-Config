{ pkgs, ... }: {

  services.flaresolverr = {
    enable = false;
  };
  
  services.prowlarr = {
    enable = true;
  };

  services.sonarr = {
    enable = true;
  };

  services.radarr = {
    enable = true;
  };

  services.lidarr = {
    enable = true;
  };

  environment.systemPackages = [ pkgs.qbittorrent ];

}
