{ ... }: {
  
  imports = [
    ./programs.nix
    ./services.nix

    ./adguardhome.nix
    ./caddy.nix
    ./dashy.nix
    ./jellyfin.nix
    ./matrix.nix
    ./minecraft.nix
    ./servarr.nix
  ];

}
