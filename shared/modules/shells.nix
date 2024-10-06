{ pkgs, ... }:

{

  users.defaultUserShell = pkgs.fish;

  # Fish
  programs.fish = {
    enable = true;
    shellAliases = {
      lsa = "ls -a";
      lsl = "ls -l";
      rebuild = "sudo nixos-rebuild switch";
      rebuild-boot = "sudo nixos-rebuild boot";
      rebuild-update = "cd $CONFIG && nix flake update && sudo nixos-rebuild switch";
      rebuild-update-boot = "cd $CONFIG && nix flake update && sudo nixos-rebuild boot";
      rebuild-clean = "sudo nix-collect-garbage -d && sudo nixos-rebuild switch";
    };
  };

  # programs.bash = {
  #   completion.enable = true;
  #   enableLsColors = true;
  #   shellAliases = {
  #     edit = "code ~/NixOS-Config";
  #     rebuild = "sudo nixos-rebuild switch";
  #     nix-list-generations = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
  #     nix-delete-old-generations = "sudo nix-collect-garbage --delete-older-than 2d && sudo nix-collect-garbage -d";
  #     nix-update = "cd ~/NixOS-Config && sudo nix flake update && sudo nixos-rebuild switch";
  #     nix-update-boot = "cd ~/NixOS-Config && sudo nix flake update && sudo nixos-rebuild boot";
  #   };
  # };
  

}
