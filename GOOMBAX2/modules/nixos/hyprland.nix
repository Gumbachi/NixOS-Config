{ pkgs, config, lib, ...}: {

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
    waypaper # Wallpaper GUI
    imv # Image Viewer
    kdePackages.gwenview # Simple Image Editor
    pavucontrol # Sound Settings
    grimblast # Screenshots

    nwg-look # GTK Style GUI

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
