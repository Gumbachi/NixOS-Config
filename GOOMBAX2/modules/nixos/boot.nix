{ config, pkgs, ... }:

{
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelParams = [
    "acpi_rev_override"
    "quiet"  
  ];

  
}
