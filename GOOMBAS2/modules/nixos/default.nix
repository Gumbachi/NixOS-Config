{ ... }: {
  
  imports = [
    ./programs.nix
    ./services.nix

    ./adguardhome.nix
    ./caddy.nix
    ./homepage.nix
    ./immich.nix
    ./jellyfin.nix
    ./jellyseerr.nix
    ./open-deluge.nix
    ./matrix.nix
    ./minecraft.nix
    ./servarr.nix
    ./syncthing.nix

    # Snatched from X1
    ../../../GOOMBAX1/modules/nixos/nvf.nix

  ];

}
