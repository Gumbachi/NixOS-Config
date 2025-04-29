{ config, ... }:
let
  userConfig = "/home/jared/NixOS-Config/GOOMBAX1/.config";
in
{

  home.username = "jared";
  home.homeDirectory = "/home/jared";

  programs.git = {
    enable = true;
    userName = "Gumbachi";
    userEmail = "github@gumbachi.com";
  };

  services.hyprpaper.enable = true;
  programs.qutebrowser.enable = true;
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
