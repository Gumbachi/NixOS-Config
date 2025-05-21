{ config, ... }: {

  age.secrets.pia.file = ../../secrets/pia.age; 
  services.openvpn.servers.homeVPN = { 
    config = ''
      config /home/jared/A/OpenVPN/homeVPN.ovpn
      auth-user-pass ${config.age.secrets.pia.path}
    '';
    autoStart = true;
  };

}
