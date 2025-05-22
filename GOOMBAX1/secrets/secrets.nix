let
  jared = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGvJ/mvigyGpxh0SNRWqxYLS3HcsBhGPG1Pat7ldit+T";
  x1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPUzNdd3sIqC2EziqUGF+TYhUI7tOFftElDn8nWAp4uF";
in
{
  "pia.age".publicKeys = [ jared x1 ];
}
