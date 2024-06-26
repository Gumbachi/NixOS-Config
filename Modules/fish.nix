{ config, pkgs, ... }:

{

    # Fish Setup
  programs.fish = {
    enable = true;
    shellAliases = { 
      nix-edit = "codium /home/jared/nixos-config";
      nix-list-generations = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      nix-delete-old-generations = "sudo nix-collect-garbage --delete-older-than 2d && sudo nix-collect-garbage -d";
      nix-save = "sudo nix flake update && sudo nixos-rebuild switch";
      nix-save-boot = "sudo nix flake update && sudo nixos-rebuild boot";
    };
  };
  users.defaultUserShell = pkgs.fish;

}