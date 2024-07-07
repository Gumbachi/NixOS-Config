{ config, pkgs, ... }:

{

  home.username = "jared";
  home.homeDirectory = "/home/jared";

  home.packages = with pkgs; [

    # Command line tools
    fastfetch
    tldr
    just
    killall

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
    pavucontrol
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
      "editor.fontFamily" = "'BlexMono Nerd Font', 'JetBrainsMono NF', 'Consolas'";
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

    "hypr/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/jared/NixOS-Config/.config/hypr/hyprland.conf";
    "hypr/hyprlock.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/jared/NixOS-Config/.config/hypr/hyprlock.conf";
    "hypr/hyprpaper.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/jared/NixOS-Config/.config/hypr/hyprpaper.conf";
    
  };

  home.file = {

    ".config/YouTube Music/config.json".source = config.lib.file.mkOutOfStoreSymlink "/home/jared/NixOS-Config/.config/YouTube Music/config.json";
    ".config/vesktop/settings/settings.json".source = config.lib.file.mkOutOfStoreSymlink "/home/jared/NixOS-Config/.config/vesktop/settings/settings.json";

    ".config/kitty/kitty.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/jared/NixOS-Config/.config/kitty/kitty.conf";
    ".config/fish/config.fish".source = ../.config/fish/config.fish;

  };

  # # Sync entire .config
  # home.file.".config" = {

  #   recursive = true;
  #   source = ../.config;
  #   enable = true;
    
  # };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}