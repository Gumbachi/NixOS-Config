{ ... }: {
  
  environment.sessionVariables = {
    CONFIG = "/home/jared/NixOS-Config";
    NIXOS_OZONE_WL = "1";
    MANGOHUD_CONFIG = "position=top-right,frame_timing=0,round_corners=10.0,frametime=0,hud_no_margin,background_alpha=0,table_columns=2";
    MOZ_ENABLE_WAYLAND = "1";
    AMD_VULKAN_ICD="RADV";
    EDITOR="nvim";
    CPU_TEMP_FILE="/sys/class/hwmon/hwmon2/temp3_input";
    ETHERNET_DEVICE_NAME="enp5s0";
  };
  
}
