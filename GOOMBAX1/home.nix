{ config, pkgs, ... }:

{

  home.username = "jared";
  home.homeDirectory = "/home/jared";

  home.packages = with pkgs; [

    # Command line tools
    fastfetch
    tldr
    kitty

    # Media/Social
    vlc
    youtube-music
    vesktop

    # Browsers
    floorp
    firefox

    # Office
    libreoffice-qt6-fresh
    hunspell
    hunspellDicts.en_US

    # Other
    protonup-qt
    keymapp
    inkscape

  ];

  programs.git = {
    enable = true;
    userName = "Gumbachi";
    userEmail = "jaredremsberg@gmail.com";
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc-icons
      catppuccin.catppuccin-vsc
      bbenoist.nix
      ms-python.python
      zaaack.markdown-editor
    ];
    userSettings = {
      "telemetry.telemetryLevel" = "off";
      "workbench.iconTheme" = "catppuccin-macchiato";
      "workbench.colorTheme" = "Catppuccin Macchiato";
      "editor.fontFamily" = "'IBM Plex Mono', 'Consolas'";
      "editor.fontWeight" = "600";
      "explorer.confirmDelete" = false;
      "workbench.startupEditor" = "none";
      "update.showReleaseNotes" = false;
      "explorer.confirmDragAndDrop" = false;
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
  };
  
  # Files in ~/.config/
  xdg.configFile = {

    "YouTube Music/config.json".source = config.lib.file.mkOutOfStoreSymlink "/home/jared/NixOS-Config/Dotfiles/youtube-music/config.json";

    "vesktop/settings/settings.json".source = config.lib.file.mkOutOfStoreSymlink "/home/jared/NixOS-Config/Dotfiles/vesktop/settings.json";
    
  };

  # Files in ~/
  home.file = {

  };

  # direct symlink, an absolute path string is required if you're using flakes
  # xdg.configFile.foo.source =  config.lib.file.mkOutOfStoreSymlink "/absolute/path/to/bar";


  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}