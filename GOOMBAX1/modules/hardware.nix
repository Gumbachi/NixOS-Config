{ config, pkgs, ... }:

{

  hardware = {

    graphics = {
      enable = true;
      enable32Bit = true;
     # extraPackages = [ pkgs.rocmPackages.rocm-smi ];
    };

    amdgpu = {
      initrd.enable = true;
      amdvlk = {
        enable = false;
        support32Bit.enable = false;
      };
    };

    keyboard.zsa.enable = true;

    logitech.wireless.enable = true;

  };
  
}
