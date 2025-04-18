{ pkgs, config, ... }:

let
  userConfig = "/home/jared/NixOS-Config/GOOMBAX1/.config";
  nixosConfig = "/home/jared/NixOS-Config";
  homeModulesPath = ./modules/home;
in
{

  imports = [
    (homeModulesPath + /catppuccin.nix)
  ];

  home.username = "jared";
  home.homeDirectory = "/home/jared";

  # programs.ags = {
  #   enable = true;
  #   extraPackages = with pkgs; [
  #     wlsunset
  #     sox
  #     # gtksourceview
  #     # # webkitgtk
  #     # accountsservice
  #     # libdbusmenu-gtk3
  #   ];
  # };

  programs.git = {
    enable = true;
    userName = "Gumbachi";
    userEmail = "jaredremsberg@gmail.com";
  };


  ################
  ### SYMLINKS ###
  ################

  home.file = {

    # Hyprland, Hypridle, Hyprpaper, Hyprlock
    ".config/hypr/".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/hypr/";

    # Rofi
    ".config/rofi/".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/rofi/";

    # Kitty
    ".config/kitty/".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/kitty/";

    # YouTube Music
    ".config/YouTube Music/config.json".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/YouTube Music/config.json";

    # Vesktop
    ".config/vesktop/settings/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/vesktop/settings/settings.json";

    # AGS
    # ".config/ags/".source = config.lib.file.mkOutOfStoreSymlink "${nixosConfig}/shared/ags/"; 

    # Starship
    # ".config/starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/starship.toml";

    # Nushell
    # ".config/nushell/config.nu".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/nushell/config.nu";
    # ".config/nushell/env.nu".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/nushell/env.nu";

    # Btop -- Theme file is tracked with absolute path
    ".config/btop/btop.conf".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/btop/btop.conf";
    ".config/btop/themes/mocha.theme".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/btop/themes/mocha.theme";

    # Mako
    # ".config/mako/config".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/mako/config";

    # Fish -- config files have to be individual
    ".config/fish/themes/mocha.theme".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/fish/themes/mocha.theme";
    ".config/fish/config.fish".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/fish/config.fish";

    # Yazi -- config files have to be individual
    # ".config/yazi/theme.toml".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/yazi/theme.toml";
    # ".config/yazi/yazi.toml".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/yazi/yazi.toml";

    # Helix
    ".config/helix/config.toml".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/helix/config.toml";

    # Waybar
    # ".config/waybar/".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/waybar/";


    # Kvantum
    # ".config/Kvantum/".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/Kvantum/";

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
      mimeType = [ "inode/directory" ];
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
