{ ... }: {
  services.caddy = {
    enable = true;
    virtualHosts = {

      "gumbachi.com".extraConfig = ''
        respond "Hi there. Nothing in here yet"
      '';

      "watch.gumbachi.com".extraConfig = ''
        reverse_proxy localhost:8096
      '';

      "photos.gumbachi.com".extraConfig = ''
        reverse_proxy localhost:2283
      '';

    };
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
