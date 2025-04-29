{ inputs, pkgs, ... }: {

  # shared/modules/custom/terminal.nix
  terminal = {
    dropInUpgrades.enable = true; # eza, ripgrep, bat, etc..
    ricing.enable = true; # fastfetch, cava, pipes, cbonsai
    systemctl-tui.enable = true;
    unar.enable = true; # Zip archives
    unrar.enable = true; # Rar archives
  };

  # shared/modules/custom/gaming.nix
  gaming = {
    steam = {
      enable = true;
      forceDesktopScaling = true;
    };
    mangohud.enable = true;
    protonup.enable = true;
    minecraft.enable = true;
  };

  development = {
    devenv.enable = true;
    direnv.enable = true;
    android.enable = false;
    just.enable = true;
  };

  programs = {
    nix-ld.enable = true;
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
    java.enable = true;
    thunar.enable = false;
    firefox.enable = false;
    thunderbird.enable = true;
  };

  emulation = {
    gba.mgba.enable = true;
    switch.ryubing.enable = true;
  };

  editor.nvf = {
    enable = true;
    setDefault = true;
    languages = {
      python.enable = true;
      markdown.enable = true;
      css.enable = true;
      ts = {
        enable = true; 
        format.type = "biome";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    inputs.overway.packages.${system}.default
    inputs.astal.packages.${system}.default

    inputs.zen-browser.packages.${system}.default # Browser

    gimp3-with-plugins

    youtube-music

    # Make an option for video tools
    handbrake
    losslesscut-bin
    vlc # Video Player

    # Make a nice little optiosn for this
    libreoffice # Office Software
    hunspell # Spellcheck for libreoffice
    hunspellDicts.en_US # US Dictionary for spellcheck

    keymapp # Moonlander Software

    r2modman # Thunderstore mod Manager
  ];
}
