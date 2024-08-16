{ ... }: {
  
  environment.sessionVariables = {
    CONFIG = "/home/jared/NixOS-Config";
    NIXOS_OZONE_WL = "1";
    # WLR_NO_HARDWARE_CURSORS = "1";
    MANGOHUD_CONFIG = "position=top-right,frame_timing=0,font_size=14,frametime=0,hud_no_margin,background_alpha=0,table_columns=2";
    CPU_TEMP_FILE="/sys/class/thermal/thermal_zone10/temp";
  };
  
}
