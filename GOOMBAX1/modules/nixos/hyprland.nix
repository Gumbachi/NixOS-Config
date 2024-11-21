{ inputs, pkgs, ... }: {

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  programs.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

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
    lxqt.lxqt-policykit # Polkit - Sudo Prompt
  ];

  environment.sessionVariables = {
    HYPRCURSOR_SIZE = 32;
    HYPRCURSOR_THEME = "catppuccin-mocha-mauve-cursors";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_QPA_PLATFORM = "wayland;xcb";
  };

  # Lock Screen 
  security.pam.services.hyprlock = {};
  programs.hyprlock.enable = true;

  # Idle Daemon
  services.hypridle.enable = true;

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
