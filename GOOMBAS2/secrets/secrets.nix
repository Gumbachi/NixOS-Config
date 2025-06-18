let
  user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPSBzKNu2HL1mirMCmnL1FHvAJiR1lBJdWUovdSG4pUv";
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHsVQUrdY1G2DlL8l6ampkvaRp8BxnsKjhoypdVkVQ8+";
in
{
  "dashboard.age".publicKeys = [ user system ];
  "deluge-auth.age".publicKeys = [ user system ];
  "gumbotchi.age".publicKeys = [ user system ];
}
