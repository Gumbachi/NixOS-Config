{ config, pkgs, ... }:

{

  home.username = "jared";
  home.homeDirectory = "/home/jared";

  home.packages = with pkgs; [

    # Command line tools
    fastfetch
    tldr
    just

    # Media/Social
    vlc
    youtube-music
    vesktop

    # Browsers
    floorp
    firefox

    # Other
    protonup-qt
    keymapp
    kitty

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

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}