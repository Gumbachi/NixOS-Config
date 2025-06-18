{ config, lib, ... }:
let
  cfg = config.services.gumbotchi;
in
{

  options.services = {
    gumbotchi.enable = lib.mkEnableOption "Enable gumbotchi as a service";
  };

  config = lib.mkIf cfg.enable {

    age.secrets.gumbotchi.file = ../../secrets/gumbotchi.age;

    virtualisation.oci-containers.containers.gumbotchi = {
      image = "hub.docker.com/gumbachi/gumbotchi:latest";
      environmentFiles = [ config.age.secrets.gumbotchi.path ];
    };    

  };


}
