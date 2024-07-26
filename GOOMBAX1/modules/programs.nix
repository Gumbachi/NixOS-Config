{ pkgs, ... }:

{
  
  # Options
  # programs.partition-manager.enable = true;
  programs.kdeconnect = {
    enable = true;
    package = pkgs.kdePackages.kdeconnect-kde;
  };

  programs.thunar.enable = true;

  programs.corectrl = {
    enable = true;
    gpuOverclock.enable = true;
  };

  users.users.jared.packages = with pkgs; [
    amdgpu_top
    geekbench
  ];

  # System packages.
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
    hypridle # the option does not work
    hyprlock
    wlogout

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

    # Terminal
    starship
    yazi

    radeontop
    lxqt.lxqt-policykit

  ];

  # Enable media control
  services.playerctld.enable = true;

  services.fwupd.enable = true;

  
}