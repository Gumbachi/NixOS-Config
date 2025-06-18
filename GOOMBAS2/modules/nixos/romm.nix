{ lib, config, ... }:
let
  cfg = config.services.romm;
in
{

  options.services.romm.enable = lib.mkEnableOption "Enable romm for emulators";

  config = lib.mkIf cfg.enable {

    age.secrets.romm.file = ../../secrets/romm.age;

    # Main Container
    virtualisation.oci-containers.containers."romm" = {
      image = "rommapp/romm:latest";
      environment = {
        "DB_HOST" = "romm-db";
        "DB_NAME" = "romm";
        "DB_USER" = "romm-user";
      };
      environmentFiles = [ config.age.secrets.romm.path ];
      volumes = [
        "/mnt/main/config/romm/assets:/romm/assets"
        "/mnt/main/config/romm/config:/romm/config"
        "/mnt/main/config/romm/library:/romm/library"
        "/var/lib/romm/redis-data:/redis-data"
        "/var/lib/romm/resources:/romm/resources"
      ];
      ports = [ "5823:8080" ];
      dependsOn = [ "romm-db" ];
    };
    
    # DB Container
    virtualisation.oci-containers.containers."romm-db" = {
      image = "mariadb:latest";
      environment = {
        "MARIADB_DATABASE" = "romm";
        "MARIADB_USER" = "romm-user";
      };
      environmentFiles = [ config.age.secrets.romm.path ];
      volumes = [ 
        "/var/lib/romm/mysql:/var/lib/mysql"
      ];
      log-driver = "journald";
      extraOptions = [
        "--health-cmd=[\"healthcheck.sh\", \"--connect\", \"--innodb_initialized\"]"
        "--health-interval=10s"
        "--health-retries=5"
        "--health-start-period=30s"
        "--health-startup-interval=10s"
        "--health-timeout=5s"
        "--network-alias=romm-db"
        "--network=test_default"
      ];
    };
  };

}
