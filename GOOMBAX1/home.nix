{ config, pkgs, ... }:

let
  userConfig = "/home/jared/NixOS-Config/GOOMBAX1/.config";
in
{

  home.username = "jared";
  home.homeDirectory = "/home/jared";

  home.packages = with pkgs; [
    # Command line tools
    fastfetch
    tldr
    kitty
    unzip

    # Media/Social
    vlc
    mpv
    youtube-music
    vesktop

    # Browsers
    firefox
    librewolf

    # Office
    libreoffice-qt6-fresh
    hunspell
    hunspellDicts.en_US

    # Other
    protonup-qt
    keymapp
    inkscape

    kdePackages.plasma-systemmonitor

  ];

  programs.git = {
    enable = true;
    userName = "Gumbachi";
    userEmail = "jaredremsberg@gmail.com";
  };

  programs.neovim.enable = true;

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
      "window.menuBarVisibility" = "toggle";
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };


  home.file = {

    ".config/YouTube Music/config.json" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/YouTube Music/config.json";
    };

    ".config/vesktop/settings/settings.json" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/vesktop/settings/settings.json";
    };

    ".config/mako/config" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/mako/config";
    };

    ".config/fish/" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink  "${userConfig}/fish/config/";
    };

    ".config/kitty/" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/kitty/";
      recursive = true;
    };

    ".config/waybar/" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/waybar/";
      recursive = true;
    };

    ".config/hypr/" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/hypr/";
      recursive = true;
    };

    ".config/rofi/" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/rofi/";
      recursive = true;
    };

    ".config/Kvantum/" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/Kvantum/";
      recursive = true;
    };

    ".config/btop/" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/btop/";
      recursive = true;
    };

    

  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "mauve";
      size = "standard";
      tweaks = [ "normal" ];
    };
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}