{ lib, ... }: {

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  services.pulseaudio.enable = lib.mkForce false;
  
}
