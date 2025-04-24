{ inputs, lib, config, pkgs, ...}: {

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  # programs.hyprlock.enable = true;
  # services.hypridle.enable = true;

  ### Hyprland: Necessary Programs ###
  environment.systemPackages = with pkgs; [
    kitty # Terminal Emulator
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
    # kdePackages.qtwayland # Hyprland Dependency
    kdePackages.qt6ct # QT Style GUI
    kdePackages.qtstyleplugin-kvantum # QT Plugin for better Styling

    hyprsunset # Blue Light Filter
    hyprpolkitagent # Polkit - Sudo Prompt
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    # HYPRCURSOR_SIZE = 24;
    # HYPRCURSOR_THEME = "Bibata Modern Ice";
    # QT_QPA_PLATFORMTHEME = "qt6ct"; # Managed by stylix
    QT_QPA_PLATFORM = "wayland;xcb";
  };

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


  # Home Manager Options
  home-manager.sharedModules = [
    {
      services.hyprpaper.enable = true; # Managed by stylix
      services.hypridle.enable = true; 
    }
    ../home/hyprlock.nix
  ];
}
