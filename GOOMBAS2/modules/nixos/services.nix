{ ... }: {
  
  services = {
    # System Services
    power-profiles-daemon.enable = true;
    printing.enable = false;
    openssh.enable = true;

    # Self-hosted Services
    uptime-kuma.enable = true;


  };
}
