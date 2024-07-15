{ config, pkgs, ... }:

{
  
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

  # Enable media control
  services.playerctld.enable = true;

  
}