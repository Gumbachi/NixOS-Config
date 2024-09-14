{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [ 
    mangohud
    protonup-qt
  ];

  # Steam
  programs.steam = {
    enable = true;
    # gamescopeSession.enable = true;
  };

  # Gamemode
  # programs.gamemode.enable = true;

  # Gamescope
  # programs.gamescope = {
  #   enable = true;
  #   args = [
  #     "--expose-wayland"
  #     "--adaptive-sync"
  #     "-W 3840 -H 2160"
  #   ];
  #   # capSysNice = true;
  # };

  # Possibly needed environment vars
  
  # environment.sessionVariables = {
  #   STEAM_FORCE_DESKTOPUI_SCALING = "1.5"; # Necessary for 4k Monitor
  #   MANGOHUD_CONFIG = "position=top-right,frame_timing=0";
  # };

}
