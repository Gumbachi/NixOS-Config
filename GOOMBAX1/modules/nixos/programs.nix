{ inputs, pkgs, ... }: {
  
  programs.partition-manager = {
    enable = true;
    package = pkgs.kdePackages.partitionmanager;
  };
  
  programs.kdeconnect = {
    enable = true;
    package = pkgs.kdePackages.kdeconnect-kde;
  };

  programs.nix-ld.enable = true;

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    silent = true;
  };

  programs.java.enable = true;

  users.users.jared.packages = with pkgs; [
    helix
    devenv
    vulkan-tools

    # Command line tools
    fastfetch
    tldr
    kitty
    unzip
    speedtest-cli

    # Media/Social
    vlc
    youtube-music
    vesktop

    # Browsers
    inputs.zen-browser.packages."${system}".default


    # Office
    libreoffice-qt6-fresh
    hunspell
    hunspellDicts.en_US

    # Other
    keymapp # ZSA keymapp
    kontroll # ZSA CLI
    
    kdePackages.gwenview

    imagemagick
    parsec-bin

  ];

  # System packages.
  environment.systemPackages = with pkgs; [

    wget
    ripgrep
    fd
    clipse
    wl-clipboard

    # My Nixvim config
    # inputs.nvim.packages."${pkgs.system}".default

    # Notifications
    libnotify
    glib
    libgtop

    # Hyprland Stuff
    rofi-wayland
    hyprcursor
    hypridle # the option does not work
    hyprlock
    hyprpicker

    # Wallpapers
    hyprpaper
    waypaper

    imv # Image Viewer
    pavucontrol # Sound Settings
    grimblast # Screenshot Utility
    lm_sensors # Sensors
    btop # System Monitor

    # QT and GTK style
    kdePackages.qtwayland
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qtsvg
    nwg-look

    # Terminal
    starship
    yazi

    lxqt.lxqt-policykit

    # AMD GPU Stuff
    amdgpu_top
    lact

    # Blue light filter
    wlsunset

    # minecraft
    prismlauncher

    # VR
    wlx-overlay-s
    
  ];

  # Needed for lact to work correctly
  systemd.services.lact = {
    description = "AMDGPU Control Daemon";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
    enable = true;
  };

}
