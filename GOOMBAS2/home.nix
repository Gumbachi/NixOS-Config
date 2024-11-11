{ pkgs, config, ... }:

let
  GOOMBAX1 = "/home/jared/NixOS-Config/GOOMBAX1/.config";
  nixosConfig = "/home/jared/NixOS-Config";
  homeModulesPath = ./modules/home;
in
{

  # imports = [
  #   (homeModulesPath + /starter.nix)
  # ];

  home.username = "jared";
  home.homeDirectory = "/home/jared";

  programs.git = {
    enable = true;
    userName = "Gumbachi";
    userEmail = "jaredremsberg@gmail.com";
  };

  programs.zoxide.enable = true;
  programs.fzf.enable = true;


  ################
  ### SYMLINKS ###
  ################

  home.file = {

    # Starship
    ".config/starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${GOOMBAX1}/starship.toml";

    # Btop -- Theme file is tracked with absolute path
    ".config/btop/btop.conf".source = config.lib.file.mkOutOfStoreSymlink "${GOOMBAX1}/btop/btop.conf";
    ".config/btop/themes/mocha.theme".source = config.lib.file.mkOutOfStoreSymlink "${GOOMBAX1}/btop/themes/mocha.theme";

    # Fish -- config files have to be individual
    ".config/fish/themes/mocha.theme".source = config.lib.file.mkOutOfStoreSymlink "${GOOMBAX1}/fish/themes/mocha.theme";
    ".config/fish/config.fish".source = config.lib.file.mkOutOfStoreSymlink "${GOOMBAX1}/fish/config.fish";

    # Yazi -- config files have to be individual
    ".config/yazi/theme.toml".source = config.lib.file.mkOutOfStoreSymlink "${GOOMBAX1}/yazi/theme.toml";
    ".config/yazi/yazi.toml".source = config.lib.file.mkOutOfStoreSymlink "${GOOMBAX1}/yazi/yazi.toml";

    # Helix
    ".config/helix/config.toml".source = config.lib.file.mkOutOfStoreSymlink "${GOOMBAX1}/helix/config.toml";

    # Kitty
    ".config/kitty/".source = config.lib.file.mkOutOfStoreSymlink "${GOOMBAX1}/kitty/";

  };
 
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

}
