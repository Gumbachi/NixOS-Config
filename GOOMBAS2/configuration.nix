{ ... }: 

let 
  modulePath = ./modules/nixos;
  sharedModulePath = ../shared/modules;
in
{

  imports = [ 
    # Include the results of the hardware scan.
    ./hardware-configuration.nix 

    # System Specific
    (modulePath + /networking.nix)
    (modulePath + /boot.nix)
    (modulePath + /programs.nix)
    (modulePath + /services.nix)
    (modulePath + /env.nix)
    (modulePath + /minecraft.nix)


    # Shared - The same across systems 
    (sharedModulePath + /nixvim.nix)
    (sharedModulePath + /shells.nix)
    (sharedModulePath + /fonts.nix)
    (sharedModulePath + /docker.nix)
    
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.getty.autologinUser = "jared";

  # Greetd: Autostart Btop on boot
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

  catppuccin.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = false;

  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
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


  # Define a user account. Don't forget to set a password with ‘passwd’. I will.
  users.users.jared = {
    isNormalUser = true;
    description = "Jared";
    extraGroups = [ "networkmanager" "wheel" "video" "minecraft" ];
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
