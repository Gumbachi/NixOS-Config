{ pkgs, ... }: {

  users.defaultUserShell = pkgs.nushell;
  environment.systemPackages = [ pkgs.nushell ];

}
