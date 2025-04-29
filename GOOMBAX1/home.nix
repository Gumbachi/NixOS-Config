{ pkgs, config, ... }:
let
  userConfig = "/home/jared/NixOS-Config/GOOMBAX1/.config";
  nixosConfig = "/home/jared/NixOS-Config";
  homeModulesPath = ./modules/home;
  sharedHomeModules = ../shared/modules/home;
in
{

  home.username = "jared";
  home.homeDirectory = "/home/jared";

  programs.git = {
    enable = true;
    userName = "Gumbachi";
    userEmail = "jaredremsberg@gmail.com";
  };

  programs.cava.enable = true;
  services.hyprpaper.enable = true;
  programs.qutebrowser.enable = true;
  programs.zoxide.enable = true;
  services.hyprpolkitagent.enable = true;

  programs.nh = {
    enable = true;
    flake = "/home/jared/NixOS-Config";
  };

  ################
  ### SYMLINKS ###
  ################

  home.file = {
    # YouTube Music -- No home manager module yet
    ".config/YouTube Music/config.json".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/YouTube Music/config.json";
  };

  #######################
  ### DESKTOP ENTRIES ###
  #######################

  xdg.desktopEntries = {
    yazi = {
      name = "Yazi";
      genericName = "File Explorer";
      exec = "yazi";
      terminal = true;
      mimeType = ["inode/directory"];
      icon = "system-file-manager";
    };

    vlc = {
      name = "VLC";
      genericName = "Media Player";
      exec = "env -u DISPLAY vlc";
      icon = "vlc";
    };
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
