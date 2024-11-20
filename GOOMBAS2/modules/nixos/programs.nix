{ pkgs, ... }: {
  
  programs.nix-ld.enable = true;
  programs.java.enable = true;

  environment.systemPackages = with pkgs; [
    kitty # Terminal

    fastfetch # System Info
    tldr # Better Command Help
    unzip # Unzipper
    speedtest-cli # Network Speed CLI

    helix # Text Editor

    wget # Web Fetch
    ripgrep # Fast search
    fd # Another fast search
    
    lm_sensors # Sensors
    btop # System Monitor

    starship # Terminal Styling
    yazi # Terminal File Manager

    yt-dlp # YoutubeDL
 
  ];

}
