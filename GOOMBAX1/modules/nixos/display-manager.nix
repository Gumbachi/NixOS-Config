{ config, pkgs, ... }:

{
  
  # Enable the KDE Plasma Desktop Environment.
  # services.desktopManager.plasma6.enable = true;
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;

  # Enable automatic login for the user.
  # services.displayManager.autoLogin = {
  #   enable = true;
  #   user = "jared";
  # };

  # Enable Display Manager
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "jared";
      };
      default_session = initial_session;
    };
  };

  
}