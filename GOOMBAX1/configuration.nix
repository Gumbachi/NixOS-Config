{ ... }: 

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
    (modulePath + /display-manager.nix)
    (modulePath + /hardware.nix)
    (modulePath + /hyprland.nix)
    (modulePath + /sound.nix)

    # GOOMBAX1 -- Optional
    (modulePath + /programs.nix)
    (modulePath + /services.nix)
    (modulePath + /env.nix)
    (modulePath + /nixvim.nix)
    (modulePath + /android.nix)

    # Shared - The same across systems 
    (sharedModulePath + /shells.nix)
    (sharedModulePath + /fonts.nix)
    (sharedModulePath + /gaming.nix)
    # (sharedModulePath + /obs.nix)
    # (sharedModulePath + /sunshine.nix)
    
  ];


  networking.hostName = "GOOMBAX1";

  # Set your time zone.
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

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jared = {
    isNormalUser = true;
    description = "Jared";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Needed for devenv shells
  nix.extraOptions = '' trusted-users = root jared '';

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    rocmSupport = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Firewall
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
