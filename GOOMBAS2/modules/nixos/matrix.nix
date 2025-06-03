{ ... }: {

  services.matrix-conduit = {
    enable = true;
    settings.global = {
      server_name = "chat.gumbachi.com";
      allow_registration = true;
    };
  };

}
