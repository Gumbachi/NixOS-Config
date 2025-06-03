{ ... }: {
  
  imports = [
    ./programs.nix
    ./services.nix

    ./adguardhome.nix
    ./caddy.nix
    ./jellyfin.nix
    ./matrix.nix
    ./minecraft.nix
    ./servarr.nix
  ];

}
