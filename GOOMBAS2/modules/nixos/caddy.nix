{ ... }: {
  services.caddy = {
    enable = true;
    virtualHosts = {

      "gumbachi.com".extraConfig = ''
        respond "Hello, World!"
      '';

      "watch.gumbachi.com".extraConfig = ''
        reverse_proxy http://goomba.tplinkdns.com:8096
      '';

      "photos.gumbachi.com".extraConfig = ''
        reverse_proxy http://goomba.tplinkdns.com:2283
      '';

    };
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
