{ pkgs, ... }:

{

  fonts = {
    enableDefaultPackages = true; 
    packages = with pkgs; [
      nerdfonts
      inter
    ];
  };

}
