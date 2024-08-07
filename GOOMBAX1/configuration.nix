# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix # Include the results of the hardware scan.

    # GOOMBAX1 Specific
    ./modules/boot.nix
    ./modules/env.nix
    ./modules/display-manager.nix
    ./modules/hardware.nix
    ./modules/hyprland.nix
    ./modules/android.nix
    ./modules/programs.nix
    ./modules/stylix.nix
    ./modules/services.nix

    # Shared 
    ../shared/modules/shells.nix
    ../shared/modules/fonts.nix
    ../shared/modules/sound.nix
    ../shared/modules/gaming.nix
    ../shared/modules/obs.nix
    ../shared/modules/sunshine.nix
    

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
    rocmSupport = false;
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Firewall
  networking.firewall.enable = true;

  # Just leave this
  # programs.nix-ld = {
  #   enable = true;
  #   package = pkgs.nix-ld-rs;
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
