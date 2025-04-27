{ ... }: {
  
  # Just for insurance to not brick the system
  programs.kitty.enable = true;

  # Hyprland environment variables
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    # QT_QPA_PLATFORMTHEME = "qt6ct"; # Managed by stylix
  };
  
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false; # Disabled for UWSM compatibility
    settings = {
      "#comment" = "Comment test";
    };
  };

}
