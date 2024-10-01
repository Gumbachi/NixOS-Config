{ pkgs, ... }:

{

  hardware = {

     graphics = {
       enable = true;
       enable32Bit = true;
       extraPackages = [ pkgs.rocmPackages.rocm-smi ];
     };

    # amdgpu = {
    #   initrd.enable = false;
    #   amdvlk = {
    #     enable = false;
    #     support32Bit.enable = false;
    #   };
    # };

    cpu.amd.updateMicrocode = true;

    keyboard.zsa.enable = true;
    logitech.wireless.enable = true;

    
    # bluetooth = {
    #   enable = true; # enables support for Bluetooth
    #   powerOnBoot = true; # powers up the default Bluetooth controller on boot
    # };

  };
  
}
