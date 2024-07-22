{ config, pkgs, ... }:

{

  hardware = {

    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = [ pkgs.rocmPackages.rocm-smi ];
    };

    keyboard.zsa.enable = true;

    logitech.wireless.enable = true;

  };
  
}