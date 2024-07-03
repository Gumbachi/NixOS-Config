{ config, pkgs, ... }:

{

  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  environment.systemPackages = with pkgs; [

    dunst
    waybar
    rofi-wayland

    pyprland
    hyprpicker
    hyprcursor
    hyprlock
    hypridle
    hyprpaper

    imv
  ];

}