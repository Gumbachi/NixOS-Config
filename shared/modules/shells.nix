{ pkgs, ... }:

{

  users.defaultUserShell = pkgs.fish;

  # Fish
  programs.fish = {
    enable = true;
    shellAliases = {
      edit = "code ~/NixOS-Config";
      rebuild = "sudo nixos-rebuild switch";
      rebuild-boot = "sudo nixos-rebuild boot";
      nix-list-generations = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      nix-delete-old-generations = "sudo nix-collect-garbage --delete-older-than 2d && sudo nix-collect-garbage -d";
      nix-update = "cd ~/NixOS-Config && sudo nix flake update && sudo nixos-rebuild switch";
      nix-update-boot = "cd ~/NixOS-Config && sudo nix flake update && sudo nixos-rebuild boot";
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