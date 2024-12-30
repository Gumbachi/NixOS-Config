{ pkgs, ... }:

{

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    
    # kernelPackages = pkgs.linuxPackages_latest;
    kernelPackages = pkgs.linuxPackages_zen;

    # https://docs.kernel.org/gpu/amdgpu/module-parameters.html
    kernelParams = [
      # "video=DP-1:3840x2160@240"
      # "video=DP-2:2560x1440@144"
      # "video=DP-3:2560x1440@144"

      # Silent Boot
      # "quiet"
      # "splash"
      # "boot.shell_on_fail"
      # "loglevel=3"
      # "rd.systemd.show_status=false"
      # "rd.udev.log_level=3"
      # "udev.log_priority=3"
    ];

    # consoleLogLevel = 0;
    # initrd.verbose = false;

    # plymouth.enable = false;

    # loader.timeout = 3;

    # extraModprobeConfig = '' options bluetooth disable_ertm=1 '';        
  };
 
}
