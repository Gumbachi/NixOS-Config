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
    krita
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
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.colorTheme" = "Catppuccin Mocha";
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

  # Files in ~/.config/
  # Use config.lib.file.mkOutOfStoreSymlink if the program will edit the config file itself
  # requires absolute path if using above
  xdg.configFile = {

    "hypr/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/jared/NixOS-Config/Dotfiles/hypr/hyprland.conf";
    "hypr/hyprlock.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/jared/NixOS-Config/Dotfiles/hypr/hyprlock.conf";
    "hypr/hyprpaper.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/jared/NixOS-Config/Dotfiles/hypr/hyprpaper.conf";

    "kitty/kitty.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/jared/NixOS-Config/Dotfiles/kitty/kitty.conf";

    "waybar/".source = config.lib.file.mkOutOfStoreSymlink "/home/jared/NixOS-Config/Dotfiles/waybar/";
    

    "fish/config.fish".source = ../Dotfiles/config.fish;

    "YouTube Music/config.json".source = config.lib.file.mkOutOfStoreSymlink "/home/jared/NixOS-Config/Dotfiles/youtube-music/config.json";

    "vesktop/settings/settings.json".source = config.lib.file.mkOutOfStoreSymlink "/home/jared/NixOS-Config/Dotfiles/vesktop/settings.json";
    
  };

  # Files in ~/
  home.file = {

  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}