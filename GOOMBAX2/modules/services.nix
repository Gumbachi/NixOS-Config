{ config, pkgs, ... }:

{
  
  # Flatpak
  services.flatpak.enable = false;

  services.thermald.enable = true;

  services.fwupd.enable = true;


}