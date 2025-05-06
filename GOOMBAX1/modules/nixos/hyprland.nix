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
    rofi-wayland # Launcher
    hyprpicker # Color Picker
    # hyprpaper # Wallpaper Utility
    waypaper # Wallpaper GUI
    imv # Image Viewer
    kdePackages.gwenview # Simple Image Editor
    pavucontrol # Sound Settings
    grimblast # Screenshots

    nwg-look # GTK Style GUI
    kdePackages.qt6ct # QT Style GUI
    kdePackages.qtstyleplugin-kvantum # QT Plugin for better Styling

    hyprsunset # Blue Light Filter

  ];

  # Greetd: Autostart Hyprland on boot
  services.greetd = let
    session = {
      command = "${lib.getExe config.programs.uwsm.package} start hyprland-uwsm.desktop > /dev/null";
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
