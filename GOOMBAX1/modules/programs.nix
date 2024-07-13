{ config, pkgs, ... }:

{
  
  # Options
  programs.partition-manager.enable = true;
  programs.kdeconnect.enable = true;
  programs.thunar.enable = true;

  # System packages.
  environment.systemPackages = with pkgs; [
    wget

    # Notifications
    mako
    libnotify
    glib


    waybar
    rofi-wayland
    hyprcursor
    hyprpaper
    hypridle # the option does not work

    imv # Image Viewer
    pavucontrol # Sound Settings
    grimblast # Screenshot Utility
    lm_sensors # Sensors
    btop # System Monitor
    xorg.xeyes # Xwayland check

    # QT and GTK style
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
    nwg-look
    
  ];

  # Enable media control
  services.playerctld.enable = true;

  
}