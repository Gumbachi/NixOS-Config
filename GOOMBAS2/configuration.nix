{ pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix # Hardware config
    ../shared/modules/custom # Custom nix options. Does not install anything
    ./modules # System Config
  ];

  theme.catppuccin-mocha.enable = true;

  virtualisation = {
    podman.enable = true; 
    docker = {
      enable = true;
      addUserToGroup = true;
    };
  };

  networking = {
    hostName = "GOOMBAS2";
    networkmanager.enable = true;
    firewall.enable = true;
    enableIPv6 = false;
  };

  environment.sessionVariables = {
    CONFIG = "/home/jared/NixOS-Config";
    EDITOR="nvim";
  };

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "btop";
        user = "jared";
      };
      default_session = initial_session;
    };
  };

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelParams = [ "video=DP-1:1024x1280@60,rotate=90" ];
  };

  # This is for firewire. Enable when no longer needed
  boot.initrd.luks.mitigateDMAAttacks = false;

  services.xserver.videoDrivers = ["nvidia"];
  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = false;
      open = false;
    };
  };


  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  # # Main Media Storage FS
  # fileSystems."/mnt/main" = {
  #   device = "/dev/disk/by-uuid/e597d037-9a36-49b0-a974-db80fd65fb9f";
  #   fsType = "btrfs";
  #   options = ["users" "nofail"];
  # };
  #
  # # Backup FS
  # fileSystems."/mnt/backup" = {
  #   device = "/dev/disk/by-uuid/928B-0238";
  #   fsType = "exfat";
  #   options = ["users" "nofail"];
  # };


  # Access groups
  users.groups = {
    media = {};
    backup = {};
  };

  users.users.jared = {
    isNormalUser = true;
    description = "Jared";
    extraGroups = ["networkmanager" "wheel" "video" "minecraft" "docker" "media" "backup" ];
    openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGvJ/mvigyGpxh0SNRWqxYLS3HcsBhGPG1Pat7ldit+T jared@GOOMBAX1"];
  };

  nix.package = pkgs.lix;
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = ["nix-command" "flakes"];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05"; # Did you read the comment? Yep
}
