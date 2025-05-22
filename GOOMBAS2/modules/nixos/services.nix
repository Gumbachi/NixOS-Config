{ ... }: {
  
  services = {

    # Automatic firmware updater
    fwupd.enable = false;

    # Power Profiles
    power-profiles-daemon.enable = true;

    # Enable CUPS to print documents.
    printing.enable = false;

    # Enable the OpenSSH daemon.
    openssh.enable = true;

  };
}
