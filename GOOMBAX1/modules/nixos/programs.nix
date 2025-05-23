{ inputs, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    inputs.overway.packages.${system}.default
    inputs.astal.packages.${system}.default

    inputs.agenix.packages.${system}.default

    youtube-music
    # r2modman # Thunderstore mod Manager

    clipse # Clipboard Manager
    wl-clipboard # Clipboard backend
    hyprpicker # Color Picker
    pavucontrol # Sound Settings
    hyprshot
    nwg-look # GTK Style GUI
  ];

  # Home manager programs
  home-manager.sharedModules = [{
    programs.fuzzel.enable = true;
    wayland.windowManager.hyprland.enable = true;
    programs.hyprlock.enable = true;

    programs.nh = {
      enable = true;
      flake = "/home/jared/NixOS-Config";
    };
  }];

  terminals.kitty.enable = true;

  viewers = {
    qimgv.enable = true;
    imv.enable = true;
    mpv.enable = true;
    vlc.enable = true;
  };

  social = {
    vesktop.enable = true;
  };

  shells = {
    default = pkgs.fish;
    fish.enable = true;
    nushell.enable = false;
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
    switch.ryubing.enable = false;
  };

  editors = {

    libreoffice.enable = true;

    image = {
      gimp.enable = true;
      krita.enable = false;
    };

    video = {
      handbrake.enable = false;
      losslesscut.enable = false;
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
