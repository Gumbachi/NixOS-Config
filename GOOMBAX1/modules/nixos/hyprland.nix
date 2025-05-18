{ pkgs, config, lib, ...}: {

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
  };

  ### Hyprland: Necessary Programs ###
  environment.systemPackages = with pkgs; [
    clipse # Clipboard Manager
    wl-clipboard # Clipboard backend
    hyprpicker # Color Picker
    # hyprpaper # Wallpaper Utility
    imv # Image Viewer
    kdePackages.gwenview # Simple Image Editor
    pavucontrol # Sound Settings
    hyprshot

    nwg-look # GTK Style GUI
  ];

  # Greetd: Autostart Hyprland on boot
  services.greetd = let
    session = {
      command = "uwsm start hyprland-uwsm.desktop";
      user = "jared";
    };
  in {
    enable = true;
    settings = {
      initial_session = session;
      default_session = session;
    };
  };

}
