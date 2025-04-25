{ pkgs, ... }: 
let
  sharedModulePath = ../shared/modules;
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Extra Custom NixOS Options
    ../shared/modules/custom

    # GOOMBX1 Modules
    ./modules/nixos

    # Shared Modules
    (sharedModulePath + /nvf.nix)
    (sharedModulePath + /yazi.nix)
    (sharedModulePath + /starship.nix)
    (sharedModulePath + /fish.nix)
  ];

  emulation.gba.mgba.enable = true;

  # Set the system theme with stylix
  theme = {
    wallpaper = ../images/wallpapers/pixeltree.png;
    monokai.enable = true;
  };

  users.defaultUserShell = pkgs.fish;

  environment.sessionVariables = {
    CONFIG = "/home/jared/NixOS-Config";
    EDITOR = "nvim";
  };

  diagnostics.lact.enable = true;

  programs.virt-manager.enable = true;
  virtualisation = {
    docker = {
      enable = true;
      addUserToGroup = true;
    };
    libvirtd = {
      enable = true;
      addUserToGroup = true;
    };
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = [ pkgs.rocmPackages.rocm-smi ];
    };
    cpu.amd.updateMicrocode = true;
    keyboard.zsa.enable = true; 
    logitech.wireless.enable = true; 
  };

  fonts = {
    enableDefaultPackages = true; 
    packages = with pkgs; [
      nerd-fonts.blex-mono
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      inter
      vistafonts # Calibri
    ];
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
    extraOptions = ''trusted-users = root jared ''; # Devenv shells
  };

  nixpkgs.config = {
    allowUnfree = true;
    rocmSupport = true;
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jared = {
    isNormalUser = true;
    description = "Jared";
    extraGroups = ["networkmanager" "wheel" "video" "minecraft" "syncthing" "wireshark"];
  };

  documentation = {
    man.enable = false;
    cheat.enable = true;
    tldr.enable = true;
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
