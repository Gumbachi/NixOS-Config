{ config, pkgs, ... }:

{

  programs.hyprland.enable = true;

  programs.hyprlock.enable = true;
  security.pam.services.hyprlock = {};

  services.hypridle.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  environment.systemPackages = with pkgs; [
    cinnamon.nemo
    dunst
    waybar
    rofi-wayland

    kdePackages.qt6ct
    nwg-look

    pyprland
    hyprpicker
    hyprcursor
    hyprpaper

    imv

    
  ];

}