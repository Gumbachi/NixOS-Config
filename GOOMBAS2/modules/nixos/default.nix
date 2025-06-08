{ ... }: {
  
  imports = [
    ./programs.nix
    ./services.nix

    ./adguardhome.nix
    ./caddy.nix
    ./calibre.nix
    ./immich.nix
    ./jellyfin.nix
    ./matrix.nix
    ./minecraft.nix
    ./nextcloud.nix
    ./servarr.nix
  ];

}
