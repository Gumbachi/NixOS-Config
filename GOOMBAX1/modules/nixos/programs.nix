{
  inputs,
  pkgs,
  ...
}: {
  programs.direnv = {
    enable = true;
    silent = true;
  };

  programs.nix-ld.enable = true;

  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };

  programs.java.enable = true;
  programs.thunar.enable = true;
  # programs.firefox.enable = true;
  programs.thunderbird.enable = true;
  programs.wireshark.enable = true;

  environment.systemPackages = with pkgs; [
    inputs.overway.packages.${system}.default
    inputs.astal.packages.${system}.default

    dotnet-sdk

    wireguard-tools
    qutebrowser

    just

    # vscodium
    # typescript

    # mgba

    ryubing

    obsidian # Notes
    wireshark

    handbrake
    losslesscut-bin

    inputs.zen-browser.packages.${system}.default # Browser

    vlc # Video Player
    youtube-music # Music App

    vesktop # Discord Client

    libreoffice # Office Software
    hunspell # Spellcheck for libreoffice
    hunspellDicts.en_US # US Dictionary for spellcheck

    fastfetch # System Info
    tldr # Better Command Help
    # unzip # Unzipper
    unrar # Unrarrer
    unar # Better Unzip
    speedtest-cli # Network Speed CLI
    wget # Web Fetch
    ripgrep # Fast search
    fd # Another fast search
    fzf # Fuzzy Finder
    zoxide # better cd
    eza # better ls
    bat # better cat

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
