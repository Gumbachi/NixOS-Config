{ pkgs, config, ... }: {

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


  # fileSystems."/home/jared/C" = {
  #   device = "/dev/disk/by-uuid/928B-0238";
  #   fsType = "exfat";
  #   options = ["users" "nofail"];
  # };

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

  system.stateVersion = "24.05"; # Did you read the comment? Yep
}
