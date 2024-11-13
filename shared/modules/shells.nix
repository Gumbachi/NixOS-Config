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
      rebuild-update = "cd $CONFIG && sudo nix flake update && nixos-rebuild switch";
      rebuild-update-boot = "cd $CONFIG && sudo nix flake update && nixos-rebuild boot";
      rebuild-clean = "sudo nix-collect-garbage -d && nixos-rebuild switch";

      sshs1 = "ssh jared@192.168.69.1";
      sshs2 = "ssh jared@192.168.69.2";
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
