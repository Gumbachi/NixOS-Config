{ ... }: {

  imports = [
    ./virtualisation.nix
    ./documentation.nix
    ./development.nix
    ./gaming.nix
    ./emulation.nix
    ./terminal.nix
    ./theme.nix
    ./diagnostics.nix
    ./boot.nix
    ./networking.nix
  ];

}
