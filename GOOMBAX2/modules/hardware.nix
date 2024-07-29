{ lib, config, pkgs, ... }:

{
  hardware = {

    keyboard.zsa.enable = true;

    bluetooth = {
      enable = true; # enables support for Bluetooth
      powerOnBoot = true; # powers up the default Bluetooth controller on boot
    };

    graphics.enable = true;

    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = false;
      prime = {

        intelBusId = "PCI:0:2:0"; # integrated 
        nvidiaBusId = "PCI:1:0:0"; # dedicated
        offload = {
          enable = lib.mkOverride 990 true;
          enableOffloadCmd = lib.mkIf config.hardware.nvidia.prime.offload.enable true; # Provides `nvidia-offload` command.
        };

      };

    };

  }; 
}