{ ... }: {

  virtualisation.docker.enable = true;
  users.users.jared.extraGroups = [ "docker" ];

}
