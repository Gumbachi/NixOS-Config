{ config, ... }:
let
  port = 8082;
in
{
  # Reverse proxy
  services.caddy.virtualHosts."homepage.gumbachi.com" = {
    extraConfig = ''reverse_proxy localhost:${toString port}'';
    serverAliases = [ "dashboard.gumbachi.com" ];
  };

  # Secrets
  age.secrets.dashboard = {
    file = ../../secrets/dashboard.age;
    owner = "root";
    group = "users";
    mode = "400";
  };

  services.homepage-dashboard = {
    enable = true;
    listenPort = port;
    allowedHosts = "homepage.gumbachi.com,dashboard.gumbachi.com";
    environmentFile = config.age.secrets.dashboard.path;
    # environmentFile = "/mnt/main/config/homepage/homepage.env";

    # Settings - https://gethomepage.dev/configs/settings/
    settings = {
      title = "GOOMBAS2 Homepage";
      description = "My personal home server";
      theme = "dark";
      color = "slate";
      background = {
        image = "https://w.wallhaven.cc/full/5g/wallhaven-5g8r55.jpg";
        blur = "md";
      };
    };

    # Bookmarks - https://gethomepage.dev/configs/bookmarks/
    bookmarks = [];

    # Widgets - https://gethomepage.dev/configs/info-widgets/
    widgets = [
      {
        resources = {
          cpu = true;
          memory = true;
          uptime = true;
          network = true;
          disk = "/mnt/main";
        };
      }
    ];

    # Services - https://gethomepage.dev/configs/services/
    services = [
      {
        "Media" = [
          {
            "Radarr" = let
              url = "http://192.168.69.2:7878";
            in {
              icon = "radarr.png";
              description = "Movies";
              href = url;
              widget = {
                type = "radarr";
                url = url;
                key = "{{HOMEPAGE_VAR_RADARR_KEY}}";
              };
            };
          }
          {
            "Sonarr" = let
              url = "http://192.168.69.2:8989"; # THis is correct no touchy
            in {
              icon = "sonarr.png";
              description = "Shows";
              href = url;
              widget = {
                type = "sonarr";
                url = url;
                key = "{{HOMEPAGE_VAR_SONARR_KEY}}";
              };
            };
          }
        ];
      }
      {
        "My Second Group" = [
          {
            "My Second Service" = {
              description = "Homepage is the best";
              href = "http://localhost/";
            };
          }
        ];
      }
    ];


  };

}
