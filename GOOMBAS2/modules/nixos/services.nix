{ ... }: {
  
  services = {

    # Automatic firmware updater
    fwupd.enable = true;

    # Power Profiles
    power-profiles-daemon.enable = true;

    # Enable CUPS to print documents.
    printing.enable = false;
  };
}
