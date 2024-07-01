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
  

  home.file = {

    ".config/vesktop/settings/settings.json".source = ../Dotfiles/vesktop/settings.json;

    ".config/Youtube Music/config.json".source = ../Dotfiles/youtube-music/config.json;


  };


  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}