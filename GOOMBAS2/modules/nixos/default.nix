{ ... }: {

  # These are just configs they do not enable the programs themselves
  # That should be done in programs.nix or services.nix
  imports = [

    # Programs
    ../../../GOOMBAX1/modules/nixos/nvf.nix
      
    # System Services
    ./greetd.nix

    # Homelab services
    ./adguardhome.nix
    ./caddy.nix
    ./deluge-vpn.nix
    ./gumbotchi.nix
    ./homepage.nix
    ./immich.nix
    ./jellyfin.nix
    ./jellyseerr.nix
    ./open-deluge.nix
    ./matrix.nix
    ./minecraft.nix
    ./romm.nix
    ./servarr.nix
    ./syncthing.nix
    ./uptime-kuma.nix
    ./vibrant.nix

  ];

}
