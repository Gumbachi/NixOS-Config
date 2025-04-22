{ inputs, pkgs, ... }: {

  # Pretty much just a namespace see terminal-tools.nix for options
  terminal = {
    eza = {
      enable = true;
      createFishAlias = true;
    };
    bat = {
      enable = true;
      createFishAlias = true;
    };
    ripgrep = {
      enable = true;
      createFishAlias = true;
    };
    zoxide.enable = true;
    fd.enable = true;
    fastfetch.enable = true;
    fzf.enable = true;
    systemctl-tui.enable = true;
    devenv.enable = true;
    direnv.enable = true;
    wget.enable = true;
    unar.enable = true;
    unrar.enable = true;
  };

  gaming = {
    steam = {
      enable = true;
      forceDesktopScaling = true;
    };
    mangohud.enable = true;
    protonup.enable = true;
    minecraft.enable = true;
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

    ntfs3g
    btrfs-progs
    exfat
    exfatprogs

    smartmontools

    wireguard-tools
    qutebrowser

    just

    # mgba

    ryubing

    obsidian # Notes
    wireshark

    handbrake
    losslesscut-bin

    inputs.zen-browser.packages.${system}.default # Browser

    vlc # Video Player
    # youtube-music # Music App
    # vesktop # Discord Client

    libreoffice # Office Software
    hunspell # Spellcheck for libreoffice
    hunspellDicts.en_US # US Dictionary for spellcheck

    # lutris # Game Launcher // Application shortcut creator

    # qbittorrent # Bittorrent client

    keymapp # Moonlander Software
    btop # System Monitor

    # imagemagick # Terminal Image Manipulation
    # parsec-bin # Desktop Streaming Client

    # bottles # Wine Prefix Manager
    r2modman # Thunderstore mod Manager
  ];
}
