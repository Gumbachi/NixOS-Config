{ ... }:
let
  GOOMBAX1 = ../../../GOOMBAX1/modules/home;
in
{

  imports = [

    ./btop.nix
    ./podman.nix

    # Use modules from GOOMBAX1
    (GOOMBAX1 + /fish.nix)
    (GOOMBAX1 + /starship.nix)
    (GOOMBAX1 + /yazi.nix)
    (GOOMBAX1 + /kitty.nix)

  ];

}
