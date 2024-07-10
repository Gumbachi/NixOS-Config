{ inputs, config, pkgs, ... }:

{

  programs.hyprland.enable = true;

  programs.hyprlock.enable = true;
  security.pam.services.hyprlock = {};

  services.hypridle.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # Needed to make system file picker work
  # do not touch
  xdg.portal = {
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
    config.preferred.default = ["hyprland" "gtk"];
  };

}