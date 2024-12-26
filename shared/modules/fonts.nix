{ pkgs, ... }:

{

  fonts = {
    enableDefaultPackages = true; 
    packages = with pkgs; [
      nerd-fonts.blex-mono
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.zed-mono
      # nerdfonts
      inter
    ];
  };

}
