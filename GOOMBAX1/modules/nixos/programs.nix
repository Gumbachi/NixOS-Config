{ inputs, pkgs, ... }: {
  
  programs.partition-manager = {
    enable = true;
    package = pkgs.kdePackages.partitionmanager;
  };
  
  programs.thunar.enable = true;

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

  environment.systemPackages = with pkgs; [

    inputs.zen-browser.packages."${system}".default # Browser
    # inputs.umu.packages.${pkgs.system}.umu

    vlc # Video Player
    youtube-music # Music App
    vesktop # Discord Client

    libreoffice # Office Software
    hunspell # Spellcheck for libreoffice
    hunspellDicts.en_US # US Dictionary for spellcheck

    fastfetch # System Info
    tldr # Better Command Help
    unzip # Unzipper
    speedtest-cli # Network Speed CLI

    # openvpn3 # VPN Client
    qbittorrent # Bittorrent client
    # mullvad-vpn

    helix # Text Editor
    devenv # Automatic Dev Environments

    keymapp # Moonlander Software
    kontroll # Moonlander Control API

    wget # Web Fetch
    ripgrep # Fast search
    fd # Another fast search
    
    libnotify # Send Test Notifications
 
    lm_sensors # Sensors
    btop # System Monitor

    starship # Terminal Styling
    yazi # Terminal File Manager

    amdgpu_top # GPU Monitor
    lact # GPU Manager

    wlsunset # Blue Light Filter
    sox # Play audio from terminal
    prismlauncher # Minecraft Launcher

    imagemagick # Terminal Image Manipulation
    parsec-bin # Desktop Streaming Client
 
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
