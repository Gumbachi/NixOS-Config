let
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPSBzKNu2HL1mirMCmnL1FHvAJiR1lBJdWUovdSG4pUv";
in
{
  "homepage.age".publicKeys = [ system ];
  "radarr-key.age".publicKeys = [ system ];
  "sonarr-key.age".publicKeys = [ system ];
}
