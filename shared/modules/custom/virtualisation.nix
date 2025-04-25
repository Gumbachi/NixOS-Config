{ config, lib, ... }:

with lib;

let
  cfg = config.virtualisation;
in {

  options.virualisation = {

    docker.addUserToGroup = mkEnableOption ''Add user to "docker" group'';
    libvirtd.addUserToGroup = mkEnableOption ''Add user to "libvirtd" group'';

  };

  config = mkMerge [

    (mkIf cfg.docker.enable && cfg.docker.addUserToGroup {
      users.users.jared.extraGroups = [ "docker" ];
    })

    (mkIf cfg.libvirtd.enable && cfg.libvirtd.addUserToGroup {
      users.users.jared.extraGroups = [ "libvirtd" ];
    })

  ];
}
