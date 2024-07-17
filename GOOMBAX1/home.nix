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
    youtube-music
    vesktop

    # Browsers
    firefox
    floorp

    # Office
    libreoffice-qt6-fresh
    hunspell
    hunspellDicts.en_US

    # Other
    protonup-qt
    keymapp
    inkscape
    kdePackages.gwenview

    imagemagick

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
      tamasfe.even-better-toml
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

  programs.zoxide.enable = true;
  programs.fzf.enable = true;

  home.file = {

    # YouTube Music
    ".config/YouTube Music/config.json" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/YouTube Music/config.json";
    };

    # Vesktop
    ".config/vesktop/settings/settings.json" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/vesktop/settings/settings.json";
    };

    # Yazi
    ".config/yazi/theme.toml" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/yazi/theme.toml";
    };

    # Starship
    ".config/starship.toml" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/starship.toml";
    };

    # Mako
    ".config/mako/config" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/mako/config";
    };

    # Fish -- config files have to be individual to prevent populating the github repo
    ".config/fish/themes/mocha.theme" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/fish/themes/mocha.theme";
    };

    ".config/fish/config.fish" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/fish/config.fish";
    };

    # Kitty
    ".config/kitty/" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/kitty/";
      recursive = true;
    };

    # Waybar
    ".config/waybar/" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/waybar/";
      recursive = true;
    };

    # Hyprland, Hypridle, Hyprpaper, Hyprlock
    ".config/hypr/" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/hypr/";
      recursive = true;
    };

    # Rofi
    ".config/rofi/" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/rofi/";
      recursive = true;
    };

    # Kvantum
    ".config/Kvantum/" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/Kvantum/";
      recursive = true;
    };

    # Btop
    ".config/btop/" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/btop/";
      recursive = true;
    };

    # Wlogout
    ".config/wlogout/" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/wlogout/";
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