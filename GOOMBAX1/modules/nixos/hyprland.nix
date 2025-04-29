{ inputs, lib, config, pkgs, ...}: {

  programs.hyprland = {
    enable = true;
    withUWSM = true;
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
