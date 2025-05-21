{ inputs, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    inputs.overway.packages.${system}.default
    inputs.astal.packages.${system}.default

    youtube-music

    element-desktop

    # Make an option for video tools
    vlc # Video Player

    r2modman # Thunderstore mod Manager
  ];

  # Home manager programs
  home-manager.sharedModules = [{
    programs.fuzzel.enable = true;
    wayland.windowManager.hyprland.enable = true;
    programs.hyprlock.enable = true;
    programs.yazi.enable = true;
    programs.vesktop.enable = true;
    programs.mpv.enable = true;

    programs.nh = {
      enable = true;
      flake = "/home/jared/NixOS-Config";
    };
  }];

  terminals.kitty.enable = true;

  shells = {
    default = pkgs.fish;
    fish.enable = true;
    nushell.enable = true;
  };

  file-managers = {
    yazi.enable = true;
    thunar.enable = false;
  };

  cli-tools = {
    upgrades.enable = true; # Upgrade common tools like ls,cat,etc
    ricing.enable = true; # Enable for fun style tools like cava
    starship.enable = true;
    unar.enable = true; # Zip archives
    unrar.enable = true; # Rar archives
  };

  gaming = {
    steam = {
      enable = true;
      forceDesktopScaling = true;
    };
    mangohud.enable = true;
    protonup.enable = true;
    minecraft.enable = true;
  };

  email = {
    thunderbird.enable = true;
    aerc.enable = true;
  };

  development = {
    devenv.enable = true;
    direnv.enable = true;
    android.enable = false;
    just.enable = true;
  };

  browsers = {
    floorp.enable = true;
    ladybird.enable = false;
  };

  programs = {
    nix-ld.enable = true;
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
    java.enable = true;
  };

  diagnostics = {
    lact.enable = true;
    btop.enable = true;
    systemctl-tui.enable = true;
  };

  emulation = {
    gba.mgba.enable = true;
    switch.ryubing.enable = true;
  };

  editors = {

    libreoffice.enable = true;

    image = {
      gimp.enable = true;
      krita.enable = true;
    };

    video = {
      handbrake.enable = true;
      losslesscut.enable = true;
    };

    text.nvf = {
      enable = true;
      setDefault = true;
      languages = {
        python.enable = true;
        markdown.enable = true;
        css.enable = true;
        nix = {
          enable = true;
          format.enable = false;
          lsp.server = "nixd";
        };
        ts = {
          enable = true;
          format.enable = false;
        };
      };
    };

  };

}
