{ ... }: {
  
  imports = [

    # Browsers
    ./browsers/chromium.nix
    ./browsers/floorp.nix
    ./browsers/librewolf.nix

    # Launchers
    ./launchers/fuzzel.nix
    ./launchers/rofi.nix
    ./launchers/walker.nix

    # Hypr Ecosystem
    ./hypr/hyprland.nix
    ./hypr/hypridle.nix
    ./hypr/hyprlock.nix
    ./hypr/hyprsunset.nix

    # Other
    ./btop.nix
    ./fish.nix
    ./git.nix
    ./kitty.nix
    ./mangohud.nix
    ./starship.nix
    ./vesktop.nix
    ./wlsunset.nix
    ./yazi.nix
  ];

}
