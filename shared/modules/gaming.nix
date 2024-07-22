{ config, pkgs, ... }:

{

  users.users.jared.packages = with pkgs; [ 
    mangohud
    protonup-qt
  ];

  # Steam
  programs.steam = {
    enable = true;
    # gamescopeSession.enable = true;
  };

  # Gamemode
  programs.gamemode.enable = true;

  # Gamescope
  programs.gamescope = {
    enable = true;
    # capSysNice = true;
  };

  # Possibly needed environment vars
  
  # environment.sessionVariables = {
  #   STEAM_FORCE_DESKTOPUI_SCALING = "1.5"; # Necessary for 4k Monitor
  #   MANGOHUD_CONFIG = "position=top-right,frame_timing=0";
  # };

}