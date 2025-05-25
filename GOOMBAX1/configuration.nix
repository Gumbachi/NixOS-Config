{ user, pkgs, lib, ... }: {

  imports = [
    ./hardware-configuration.nix # Mandatory hardware config
    ../shared/modules/custom # Custom nix option definitions. Does not install anything
    ./modules # Modules declaring the system layout
  ];

  # Set the system theme with stylix
  theme = {
    wallpaper = ../images/wallpapers/bisbiswas05.jpg;
    monokai.enable = true;
  };

  boot = {
    quiet = true;
    kernelPackages = pkgs.linuxPackages_zen;
    loader.systemd-boot.enable = true;
    plymouth.enable = true;
  };

  networking = {
    hostName = "GOOMBAX1";
    firewall.enable = true;
    networkmanager = {
      enable = true;
      plugins = [ pkgs.networkmanager-openvpn ];
    };
  };

  environment.sessionVariables.CONFIG = "/home/jared/NixOS-Config";

  virtualisation = {
    virt-manager.enable = true;
    docker = {
      enable = false;
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

    logitech.wireless = {
      enable = true;
      enableGraphical = true;
    };

    keyboard.zsa = {
      enable = true; 
      keymapp.enable = true;
      kontroll.enable = true;
    };
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


  services.pulseaudio.enable = lib.mkForce false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    rocmSupport = true;
  };

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };

  documentation = {
    man.enable = true;
    tldr.enable = true;
  };

  system.stateVersion = "24.05"; # Did you read the comment? yes
}
