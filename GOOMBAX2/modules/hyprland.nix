{ inputs, config, pkgs, ... }:

{

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  programs.hyprland.enable = true;

  programs.hyprlock.enable = true;
  security.pam.services.hyprlock = {};

  # Needed to make system file picker work
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

}