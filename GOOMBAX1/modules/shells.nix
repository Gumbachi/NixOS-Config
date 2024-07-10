{ config, pkgs, ... }:

{

  users.defaultUserShell = pkgs.fish;

  # Fish
  programs.fish = {
    enable = true;
  };

  programs.bash = {
    completion.enable = true;
    enableLsColors = true;
  };
  

}