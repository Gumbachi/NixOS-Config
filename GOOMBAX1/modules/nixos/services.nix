{ ... }: {
  
  services.fwupd.enable = true;

  services.blueman.enable = false;

  services.playerctld.enable = true;

  services.gvfs.enable = true;

  
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

}
