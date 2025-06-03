{ pkgs, ... }: {
  
  environment.systemPackages = with pkgs; [
    speedtest-cli # Network Speed CLI

    # DV recording Tools
    dvgrab
    ffmpeg-headless
 
    yt-dlp # YoutubeDL

    jdk # Java 21
    jdk8 # Java 8

    podman-compose
    docui
 
  ];

  home-manager.sharedModules = [{
    programs.nh = {
      enable = true;
      flake = "/home/jared/NixOS-Config";
    };
  }];

  launchers.walker.enable = false;
   
  terminals.kitty.enable = true;

  shells = {
    default = pkgs.fish;
    fish.enable = true;
  };

  file-managers.yazi.enable = true;

  documentation = {
    man.enable = true;
    tldr.enable = true;
  };

  cli-tools = {
    upgrades.enable = true; # Upgrade common tools like ls,cat,etc
    starship.enable = true;
    fastfetch.enable = true;
    unar.enable = true; # Zip archives
    unrar.enable = true; # Rar archives
  };

  development = {
    devenv.enable = true;
    direnv.enable = true;
    just.enable = true;
  };

  programs = {
    nix-ld.enable = true;
  };

  diagnostics = {
    btop.enable = true;
    systemctl-tui.enable = true;
    networking-tools.enable = true;
    lm-sensors.enable = true;
  };

  editors.text.nvf = {
    enable = true;
    setDefault = true;
    languages = {
      nix = {
        enable = true;
        format.enable = false;
        lsp.server = "nixd";
      };
    };
  };

}
