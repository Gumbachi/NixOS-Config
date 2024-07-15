{ config, pkgs, ... }:

{
  
  environment.sessionVariables = {
    CONFIG = "/home/jared/NixOS-Config";
    NIXOS_OZONE_WL = "1";
    # WLR_NO_HARDWARE_CURSORS = "1";
  };
  
}