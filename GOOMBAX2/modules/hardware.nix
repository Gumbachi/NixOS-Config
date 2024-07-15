{ config, pkgs, ... }:

{
  hardware = {

    keyboard.zsa.enable = true;

    bluetooth = {
      enable = true; # enables support for Bluetooth
      powerOnBoot = true; # powers up the default Bluetooth controller on boot
    };

    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = false;
    };

  }; 
}