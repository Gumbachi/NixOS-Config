{ config, pkgs, ... }:

{
  
  # Options
  programs.partition-manager.enable = false;
  programs.kdeconnect.enable = false;
  programs.thunar.enable = true;

  # System packages.
  environment.systemPackages = with pkgs; [

  ];

  
}