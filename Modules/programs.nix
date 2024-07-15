{ config, pkgs, ... }:

{
  
  # Flatpak
  # services.flatpak.enable = false;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # xdg.portal.config.common.default = "gtk";

  # Options
  # programs.partition-manager.enable = true;
  # programs.kdeconnect.enable = true;
  programs.thunar.enable = true;

  
  # User packages.
  users.users.jared.packages = with pkgs; [
  ];
  

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget

    # Notifications
    mako
    libnotify
    glib

    # Hyprland Stuff
    waybar
    rofi-wayland
    hyprcursor
    hyprpaper

    imv # Image Viewer
    pavucontrol # Sound Settings
    grimblast # Screenshot Utility
    lm_sensors # Sensors
    btop # System Monitor
    xorg.xeyes # Xwayland check
    kdePackages.ark

    # QT and GTK style
    kdePackages.qtwayland
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qtsvg
    nwg-look
  ];

  # environment.plasma6.excludePackages = with pkgs.kdePackages; [
  #   oxygen
  # ];

  
}