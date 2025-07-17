{ config, ... }:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  userConfig = "/home/jared/NixOS-Config/GOOMBAX1/.config";
in
{

  home.username = "jared";
  home.homeDirectory = "/home/jared";

  ################
  ### SYMLINKS ###
  ################

  home.file = {
    # YouTube Music -- No home manager module yet
    ".config/YouTube Music/config.json".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/YouTube Music/config.json";

    # Home dir symlinks
    "Documents".source = mkOutOfStoreSymlink "/mnt/ext/documents";
    "Games/main".source = config.lib.file.mkOutOfStoreSymlink "/home/jared/.local/share/Steam/steamapps";
    "Games/ext".source = config.lib.file.mkOutOfStoreSymlink "/mnt/ext/steam-library/steamapps";
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
