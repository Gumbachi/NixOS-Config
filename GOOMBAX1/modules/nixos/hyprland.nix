{ inputs, pkgs, ... }: {

  programs.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  ### Hyprland: Necessary Programs ###
  environment.systemPackages = with pkgs; [
    kitty # Terminal Emulator
    clipse # Clipboard Manager
    wl-clipboard # Clipboard backend
    rofi-wayland # Launcher
    hyprpicker # Color Picker
    hyprpaper # Wallpaper Utility
    waypaper # Wallpaper GUI
    imv # Image Viewer
    kdePackages.gwenview # Simple Image Editor
    pavucontrol # Sound Settings
    grimblast # Screenshots
    kdePackages.qtwayland # Hyprland Dependency
    kdePackages.qt6ct # QT Style GUI
    kdePackages.qtstyleplugin-kvantum # QT Plugin for better Styling
    nwg-look # GTK Style GUI
    # lxqt.lxqt-policykit # Polkit - Sudo Prompt

    hyprsunset # Blue Light Filter
    hyprpolkitagent # Polkit - Sudo Prompt
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    HYPRCURSOR_SIZE = 32;
    HYPRCURSOR_THEME = "catppuccin-mocha-mauve-cursors";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_QPA_PLATFORM = "wayland;xcb";
  };

  # Greetd: Autostart Hyprland on boot
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
