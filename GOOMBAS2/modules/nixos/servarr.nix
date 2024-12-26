{ pkgs, ... }: {

  nixpkgs.config.permittedInsecurePackages = [
    "aspnetcore-runtime-6.0.36"
    "aspnetcore-runtime-wrapped-6.0.36"
    "dotnet-sdk-6.0.428"
    "dotnet-sdk-wrapped-6.0.428"
  ];

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
