{ ... }: {

  services.calibre-server = {
    enable = true;
    port = 9292;
    group = "media";
    openFirewall = true;
    auth.enable = true;
    libraries = [
      "/mnt/main/Media/Books" 
    ];
  };

}
