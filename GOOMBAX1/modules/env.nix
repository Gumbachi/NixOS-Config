{ config, pkgs, ... }:

{
  
  environment.sessionVariables = {
    CONFIG = "/home/jared/NixOS-Config";
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    # STEAM_FORCE_DESKTOPUI_SCALING = "1.5"; # Necessary for 4k Monitor
    MANGOHUD_CONFIG = "position=top-right,frame_timing=0";
    MOZ_ENABLE_WAYLAND = "1";
    AMD_VULKAN_ICD="RADV"
  };
  
}