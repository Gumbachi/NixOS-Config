{ inputs, pkgs, ... }: {
  
  programs.direnv = {
    enable = true;
    silent = false;
  };

  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };

  programs.java.enable = true;
  programs.firefox.enable = true;
  programs.thunderbird.enable = true;
  programs.wireshark.enable = true;


  environment.systemPackages = with pkgs; [

    obsidian # Notes
    wireshark

    handbrake
    losslesscut-bin

    inputs.zen-browser.packages."${system}".default # Browser

    vlc # Video Player
    youtube-music # Music App
    
    vesktop # Discord Client

    # Have to do this to fix screenshare on hyprland 0.47
    # (vesktop.override {
    #  electron = pkgs.electron_33;
    # })


    libreoffice # Office Software
    hunspell # Spellcheck for libreoffice
    hunspellDicts.en_US # US Dictionary for spellcheck

    fastfetch # System Info
    tldr # Better Command Help
    unzip # Unzipper
    speedtest-cli # Network Speed CLI
    wget # Web Fetch
    ripgrep # Fast search
    fd # Another fast search
    fzf # Fuzzy Finder
    zoxide # better cd
    eza # better ls

    # lutris # Game Launcher // Application shortcut creator

    systemctl-tui # TUI for systemctl
    qbittorrent # Bittorrent client
    bitwarden-desktop # Password Vault

    helix # Text Editor
    devenv # Automatic Dev Environments

    keymapp # Moonlander Software

    btop # System Monitor

    prismlauncher # Minecraft Launcher

    # imagemagick # Terminal Image Manipulation
    # parsec-bin # Desktop Streaming Client

    # bottles # Wine Prefix Manager
    r2modman # Thunderstore mod Manager

  ];

}
