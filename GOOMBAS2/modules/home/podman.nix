{ ... }: {

  services.podman = {
    enable = true;
    # containers = {
    #   "gumbotchi" = {
    #     image = "https://github.com/Gumbachi/GumBOTchi/blob/main/Dockerfile";
    #     environmentFile = [ "/home/jared/B/Config/GumBOTchi/.env" ];
    #     autoStart = true;
    #   };
    # };
  };

}
