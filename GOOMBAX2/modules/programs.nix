{ config, pkgs, ... }:

{
  # Options

  # programs.partition-manager.enable = true;
  # programs.kdeconnect.enable = true;
  programs.thunar.enable = true;
  programs.dconf.enable = true;

  # User Packages
  users.users.jared.packages = with pkgs; [
    # Command line tools
    fastfetch
    tldr
    kitty
    unzip

    # Media/Social
    vlc
    youtube-music
    vesktop

    helix

    # Browsers
    floorp
    # firefox

    # Other
    keymapp
  ];  

  # System Packages
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
    hypridle # the option doesnt work

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

    brightnessctl

    starship
    yazi

  ];

}
