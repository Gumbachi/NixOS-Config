# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    # GOOMBAX2 Specific
    ./modules/hardware.nix
    ./modules/boot.nix
    ./modules/display-manager.nix
    ./modules/hyprland.nix
    ./modules/programs.nix
    ./modules/services.nix
    ./modules/env.nix
    ./modules/stylix.nix

    # Shared
    ../shared/modules/fonts.nix
    ../shared/modules/shells.nix
    ../shared/modules/sound.nix
    ../shared/modules/gaming.nix

  ];

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jared = {
    isNormalUser = true;
    description = "Jared";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Enable networking
  networking.networkmanager.enable = true;

  networking.hostName = "GOOMBAX2"; # Define your hostname.

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # Disable man pages
  documentation.man.enable = false;

  services.xserver.videoDrivers = ["nvidia"];


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

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
