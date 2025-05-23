{...}: {
  services.caddy = {
    enable = true;
    virtualHosts = {
      "gumbachi.com".extraConfig = ''
        respond "Hi there. Nothing in here yet"
      '';

      "chat.gumbachi.com".extraConfig = ''
        reverse_proxy localhost:6167
      '';

      "watch.gumbachi.com".extraConfig = ''
        reverse_proxy localhost:8096
      '';

      "request.gumbachi.com".extraConfig = ''
        reverse_proxy localhost:5055
      '';

      "photos.gumbachi.com".extraConfig = ''
        reverse_proxy localhost:2283
      '';

      "sync.gumbachi.com".extraConfig = ''
        reverse_proxy localhost:8384
      '';

      "home.gumbachi.com".extraConfig = ''
        reverse_proxy 192.168.69.2:8123
      '';

      "alias.gumbachi.com".extraConfig = ''
        reverse_proxy localhost:8000
      '';
    };
  };

  networking.firewall.allowedTCPPorts = [80 443];
}
