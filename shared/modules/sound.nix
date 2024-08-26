{ lib, config, ... }: {

  # options = {
  #   sound.extraSupport.enable = lib.mkEnableOption "Use if sound is not working";
  # };

  # config = lib.mkIf config.integratedSound.enable {    
  #   security.rtkit.enable = true;
  #   sound.enable = true;
  # };
  
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
