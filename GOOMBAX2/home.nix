{ config, pkgs, ... }:

let
  userConfig = "/home/jared/NixOS-Config/GOOMBAX2/.config";
in
{

  home.username = "jared";
  home.homeDirectory = "/home/jared";

  stylix.targets = {
    hyprpaper.enable = false;
    # gtk.enable = true; 
    mangohud.enable = true;
  };

  
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
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

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

    ".config/mako/config" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/mako/config";
    };

    # Fish config files have to be individual to prevent populating the github repo
    ".config/fish/themes/mocha.theme" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/fish/themes/mocha.theme";
    };

    ".config/fish/config.fish" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/fish/config.fish";
    };

    # Starship
    ".config/starship.toml" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/starship.toml";
    };

    # Yazi -- config files have to be individual
    ".config/yazi/theme.toml" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/yazi/theme.toml";
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
      enable = false;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/hypr/";
      recursive = true;
    };

    ".config/rofi/" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/rofi/";
      recursive = true;
    };

    ".config/btop/" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/btop/";
      recursive = true;
    };

    # Helix
    ".config/helix/config.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/helix/config.toml";
    };

  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}
