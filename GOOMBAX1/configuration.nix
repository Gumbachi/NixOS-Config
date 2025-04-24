{ pkgs, ... }: 
let
  modulePath = ./modules/nixos;
  sharedModulePath = ../shared/modules;
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # GOOMBAX1 -- Mandatory
    (modulePath + /boot.nix)
    (modulePath + /hardware.nix)
    (modulePath + /hyprland.nix)
    (modulePath + /sound.nix)
    (modulePath + /networking.nix)

    # GOOMBAX1 -- Optional
    (modulePath + /programs.nix)
    (modulePath + /services.nix)
    (modulePath + /env.nix)
    (modulePath + /android.nix)
    (modulePath + /vr.nix)
    (modulePath + /catppuccin.nix)
    (modulePath + /lact.nix)
    (modulePath + /stylix.nix)

    # Shared - The same across systems
    (sharedModulePath + /gaming.nix)
    (sharedModulePath + /terminal-tools.nix)
    (sharedModulePath + /documentation.nix)
    (sharedModulePath + /emulation.nix)
    (sharedModulePath + /personalization.nix)

    (sharedModulePath + /nvf.nix)
    (sharedModulePath + /yazi.nix)
    (sharedModulePath + /starship.nix)
    (sharedModulePath + /fish.nix)
    (sharedModulePath + /fonts.nix)
    (sharedModulePath + /docker.nix)
    (sharedModulePath + /virtualization.nix)
  ];

  emulation.gba.mgba.enable = true;

  users.defaultUserShell = pkgs.fish;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
    extraOptions = ''trusted-users = root jared ''; # Devenv shells
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    rocmSupport = true;
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jared = {
    isNormalUser = true;
    description = "Jared";
    extraGroups = ["networkmanager" "wheel" "video" "minecraft" "docker" "syncthing" "wireshark"];
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
