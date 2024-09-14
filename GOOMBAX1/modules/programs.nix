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

  programs.corectrl = {
    enable = false;
    gpuOverclock.enable = false;
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    silent = true;
  };

  users.users.jared.packages = with pkgs; [
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
    lshw

    # Media/Social
    vlc
    youtube-music
    vesktop

    # Browsers
    floorp
    inputs.zen-browser.packages."${pkgs.system}".default

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

    lxqt.lxqt-policykit

    # AMD GPU Stuff
    amdgpu_top
    lact

    # Blue light filter
    wlsunset

    # minecraft
    prismlauncher

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
