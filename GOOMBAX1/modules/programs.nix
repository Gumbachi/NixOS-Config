{ pkgs, ... }: {
  
  # programs.partition-manager.enable = true;
  programs.kdeconnect = {
    enable = true;
    package = pkgs.kdePackages.kdeconnect-kde;
  };

  programs.nix-ld.enable = true;

  programs.corectrl = {
    enable = true;
    gpuOverclock.enable = true;
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
  };

  users.users.jared.packages = with pkgs; [
    amdgpu_top
    helix
    devenv
    vulkan-tools
    furmark

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
    firefox
    floorp

    # Office
    libreoffice-qt6-fresh
    hunspell
    hunspellDicts.en_US

    # Other
    keymapp
    inkscape
    kdePackages.gwenview

    imagemagick

    # Lanuage Servers
    typescript-language-server # TS/JS
    vscode-langservers-extracted # CSS/JSON/HTML
    marksman # Markdown
    nil # Nix
    dockerfile-language-server-nodejs # Dockerfile
    python312Packages.python-lsp-ruff # Python
    python312Packages.python-lsp-server
    rust-analyzer # Rust
    taplo # TOML

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
    nix-search-cli

    radeontop
    lxqt.lxqt-policykit

  ];

}
