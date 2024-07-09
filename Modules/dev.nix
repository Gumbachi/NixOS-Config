{ config, pkgs, ... }:

{

  # fix linking errors with python and other programs
  # programs.nix-ld.enable = true;
  # services.envfs.enable = true;

  virtualisation.docker.enable = true;

  # ADB / Device Pairing
  programs.adb.enable = true;
  users.users.jared.extraGroups = [ "adbusers" "kvm" "docker" ];

  users.users.jared.packages = with pkgs; [

    # IDEs/Text Editors
    vscodium
    androidStudioPackages.canary
    
    # Python
    python3
    ruff
    uv

    # Rust
    rustup
    gcc
    
  ];

}