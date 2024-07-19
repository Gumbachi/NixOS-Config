{ config, pkgs, ... }:

{

  hardware = {

    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = [ pkgs.rocmPackages.rocm-smi ];
    };
    amdgpu.opencl.enable = true;

    cpu.amd.updateMicrocode = true;

    keyboard.zsa.enable = true;

    logitech.wireless = {
      enable = true;
      enableGraphical = true;
    };

  };
  
}