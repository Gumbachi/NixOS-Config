{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    inputs.overway.packages.${system}.default
    inputs.astal.packages.${system}.default

    inputs.zen-browser.packages.${system}.default # Browser

    youtube-music
    vlc # Video Player

    brightnessctl

    # Make a nice little option for this
    libreoffice # Office Software
    hunspell # Spellcheck for libreoffice
    hunspellDicts.en_US # US Dictionary for spellcheck
  ];

  programs = {
    nix-ld.enable = true;
    thunar.enable = false;
    firefox.enable = false;
    thunderbird.enable = true;
  };

  editor = { 
    nvf = {
      enable = true;
      setDefault = true;
      languages = {
        nix = {
          enable = true;
          format.enable = false;
          lsp.server = "nixd";
        };
        markdown.enable = true;
      };
    };
  };

  terminal = {
    dropInUpgrades.enable = true; # eza, ripgrep, bat, etc..
    systemctl-tui.enable = true;
    btop.enable = true;
    unar.enable = true; # Zip archives
    unrar.enable = true; # Rar archives
  };

  gaming = {
    steam.enable = true;
    mangohud.enable = true;
    protonup.enable = true;
  };

  development = {
    devenv.enable = true;
    direnv.enable = true;
    just.enable = true;
  };

}
