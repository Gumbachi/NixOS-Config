{ config, pkgs, ... }:

{
  
  # Flatpak
  # services.flatpak.enable = false;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # xdg.portal.config.common.default = "gtk";

  # Options
  programs.partition-manager.enable = true;
  programs.kdeconnect.enable = true;

  


  # User packages.
  users.users.jared.packages = with pkgs; [
  ];
  

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  ];

  # environment.plasma6.excludePackages = with pkgs.kdePackages; [
  #   oxygen
  # ];

  
}