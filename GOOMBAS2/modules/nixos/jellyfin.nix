{ pkgs, ... }:{

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "jared";
  };
  
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];  

  services.jellyseerr = {
    enable = true;
    openFirewall = true;
  };

}
