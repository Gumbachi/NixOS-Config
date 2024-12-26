{ ... }: {
  
  environment.sessionVariables = {
    CONFIG = "/home/jared/NixOS-Config";
    MANGOHUD_CONFIG = "position=top-right,frame_timing=0,round_corners=10.0,frametime=0,hud_no_margin,background_alpha=0,table_columns=2";
    EDITOR="nvim";
    STEAM_FORCE_DESKTOPUI_SCALING = "1.5"; # Necessary for 4k Monitor
  };
  
}
