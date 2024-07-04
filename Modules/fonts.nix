{ config, pkgs, ... }:

{

  fonts = {
    enableDefaultPackages = true; 
    packages = with pkgs; [
      fira-code
      fira-code-symbols
      jetbrains-mono
      ibm-plex
      nerdfonts
    ];
  };

}