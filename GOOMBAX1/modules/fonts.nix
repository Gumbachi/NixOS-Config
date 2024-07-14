{ config, pkgs, ... }:

{

  fonts = {
    enableDefaultPackages = true; 
    packages = with pkgs; [
      ibm-plex
      nerdfonts
      inter
    ];
  };

}