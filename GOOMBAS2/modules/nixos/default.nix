{ ... }: {
  
  imports = [
    ./programs.nix
    ./services.nix

    ./adguardhome.nix
    ./caddy.nix
    ./calibre.nix
    ./immich.nix
    ./jellyfin.nix
    ./open-deluge.nix
    ./matrix.nix
    ./minecraft.nix
    ./servarr.nix
    ./syncthing.nix
  ];

}
