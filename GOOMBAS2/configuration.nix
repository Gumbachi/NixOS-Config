{ pkgs, config, ... }: let
  modulePath = ./modules/nixos;
  sharedModulePath = ../shared/modules;
in {
  imports = [
    ./hardware-configuration.nix # Hardware config
    ../shared/modules/custom # Custom nix options. Does not install anything
    ./modules # System Config
  ];

  virtualisation = {
    docker = {
      enable = true;
      addUserToGroup = true;
    };
  };

  networking = {
    hostName = "GOOMBAS2";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 
        8123 # No idead
        43002 # Sky Factory
        22000 # Syncthing
      ];
      allowedUDPPorts = [ 
        8123 # No clue
        43002 # Sky factory
        22000 21027 # Syncthing
      ];
    };
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

    swraid = {
      enable = true;
      mdadmConf = "MAILADDR mdadm@gumbachi.com";
    };

    kernelParams = [ "video=DP-1:1024x1280@60,rotate=90" ];
  };

  boot.initrd.luks.mitigateDMAAttacks = false;

  users.defaultUserShell = pkgs.fish;

  services.getty.autologinUser = "jared";

  services.xserver.videoDrivers = ["nvidia"];
  hardware = {
    graphics = {
      enable = true;
      extraPackages = [ pkgs.nvtopPackages.nvidia ];
    };
    nvidia-container-toolkit.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.finegrained = false;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";


  fileSystems."/home/jared/C" = {
    device = "/dev/disk/by-uuid/928B-0238";
    fsType = "exfat";
    options = ["users" "nofail"];
  };

  users.users.jared = {
    isNormalUser = true;
    description = "Jared";
    extraGroups = ["networkmanager" "wheel" "video" "minecraft" "docker"];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  documentation.man.enable = false;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "24.05"; # Did you read the comment? Yep
}
