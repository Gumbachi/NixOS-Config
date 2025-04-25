{ ... }: {

  imports = [
    ./programs.nix
    ./services.nix
    ./boot.nix
    ./hyprland.nix
    ./networking.nix
    ./audio.nix 
  ];

}
