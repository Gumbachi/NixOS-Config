{ ... }: {

  services.podman = {
    enable = true;
    builds = {
      "gumbotchi" = {
        file = "/home/jared/Services/GumBOTchi/docker-compose.yml";
      };
    };
  };

}
