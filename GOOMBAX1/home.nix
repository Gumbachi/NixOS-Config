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

  programs.ags = {
    enable = true;
    extraPackages = with pkgs; [
      wlsunset
      sox
      # gtksourceview
      # # webkitgtk
      # accountsservice
      # libdbusmenu-gtk3
    ];
  };

  programs.git = {
    enable = true;
    userName = "Gumbachi";
    userEmail = "jaredremsberg@gmail.com";
  };

  # programs.zoxide.enable = true;
  # programs.fzf.enable = true;


  ################
  ### SYMLINKS ###
  ################

  home.file = {

    # YouTube Music
    ".config/YouTube Music/config.json".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/YouTube Music/config.json";

    # Vesktop
    ".config/vesktop/settings/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/vesktop/settings/settings.json";

    # AGS
    ".config/ags/".source = config.lib.file.mkOutOfStoreSymlink "${nixosConfig}/shared/ags/"; 

    # Starship
    ".config/starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/starship.toml";

    # Btop -- Theme file is tracked with absolute path
    ".config/btop/btop.conf".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/btop/btop.conf";
    ".config/btop/themes/mocha.theme".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/btop/themes/mocha.theme";

    # Mako
    ".config/mako/config".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/mako/config";

    # Fish -- config files have to be individual
    ".config/fish/themes/mocha.theme".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/fish/themes/mocha.theme";
    ".config/fish/config.fish".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/fish/config.fish";

    # Yazi -- config files have to be individual
    ".config/yazi/theme.toml".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/yazi/theme.toml";
    ".config/yazi/yazi.toml".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/yazi/yazi.toml";

    # Helix
    ".config/helix/config.toml".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/helix/config.toml";

    # Kitty
    ".config/kitty/".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/kitty/";

    # Waybar
    ".config/waybar/".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/waybar/";

    # Hyprland, Hypridle, Hyprpaper, Hyprlock
    ".config/hypr/".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/hypr/";

    # Rofi
    ".config/rofi/".source = config.lib.file.mkOutOfStoreSymlink "${userConfig}/rofi/";

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
      exec = "kitty yazi";
      terminal = true;
      mimeType = [ "inode/directory" ];
      icon = "file-system-manager";
    };
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

}
