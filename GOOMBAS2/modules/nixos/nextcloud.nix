{ pkgs, ... }: {

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud31;
    # config.adminpassFile = "/mnt/main/Secrets/nextcloud";
  };

}
