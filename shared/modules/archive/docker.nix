{ ... }: {

  virtualisation.docker.enable = true;
  users.users.jared.extraGroups = [ "docker" ];

  virtualisation.docker.daemon.settings = {
    userland-proxy = true;
  };

}
