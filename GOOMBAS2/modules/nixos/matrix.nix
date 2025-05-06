{ ... }: {

  services.matrix-conduit = {
    enable = true;
    settings.global = {
      server_name = "gumbachi.com";
    };
  };

}
