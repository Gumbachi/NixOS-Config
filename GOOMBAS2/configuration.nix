{ pkgs, ... }: 

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

    # Dedicated Services
    (modulePath + /minecraft.nix)
    # (modulePath + /mullvad.nix)
    (modulePath + /caddy.nix) # Reverse Proxy Server
    (modulePath + /deluge.nix)

    # Shared - The same across systems 
    (sharedModulePath + /nvf.nix)
    (sharedModulePath + /fish.nix)
    (sharedModulePath + /starship.nix)
    (sharedModulePath + /yazi.nix)
    (sharedModulePath + /docker.nix)    
  ];


  users.defaultUserShell = pkgs.fish;

  services.getty.autologinUser = "jared";

  catppuccin.enable = true;

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
    extraGroups = [ "networkmanager" "wheel" "video" "minecraft" "docker" ];
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
