{ ... }: {
  
  services.fwupd.enable = true;

  services.blueman.enable = false;

  services.playerctld.enable = true;

  services.gvfs.enable = true;

  
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    wireplumber = {
      enable = true;
      extraConfig = {
        "10-disable-camera" = {
          "wireplumber.profiles" = {
            main."monitor.libcamera" = "disabled";
          };
        };
      };
    };
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

}
