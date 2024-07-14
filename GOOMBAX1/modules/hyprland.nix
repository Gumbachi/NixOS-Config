{ inputs, config, pkgs, ... }:

{

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };

  programs.hyprlock.enable = true;
  security.pam.services.hyprlock = {};

  # this is broken currently
  # services.hypridle.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # Needed to make system file picker work
  # do not touch
  xdg.portal = {
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      # xdg-desktop-portal-hyprland # Not needed is included by default
    ];
    config.preferred.default = ["hyprland" "gtk"];
  };

}