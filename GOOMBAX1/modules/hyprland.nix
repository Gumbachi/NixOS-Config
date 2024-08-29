{ inputs, pkgs, ... }: {

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  programs.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };

  security.pam.services.hyprlock = {};
  programs.hyprlock.enable = true;

  # environment.sessionVariables = {
  #   NIXOS_OZONE_WL = "1";
  #   WLR_NO_HARDWARE_CURSORS = "1";
  # };

  # Needed to make system file picker work
  # do not touch
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

}
