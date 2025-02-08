{ pkgs, ... }: {
  
  programs.nix-ld.enable = true;
  programs.tmux.enable = true;

  environment.systemPackages = with pkgs; [
    kitty # Terminal

    fastfetch # System Info
    tldr # Better Command Help
    unzip # Unzipper
    speedtest-cli # Network Speed CLI
    systemctl-tui # Systemctl UI

    helix # Text Editor

    # jdk8 # Java 8

    wget # Web Fetch
    ripgrep # Fast search
    fd # Another fast search
    eza # better ls
    
    lm_sensors # Sensors
    btop # System Monitor

    # starship # Terminal Styling
    # yazi # Terminal File Manager

    yt-dlp # YoutubeDL

    nvtopPackages.full # Nvidia Monitoring

    jdk # Java 21
    jdk8 # Java 8

 
  ];

}
