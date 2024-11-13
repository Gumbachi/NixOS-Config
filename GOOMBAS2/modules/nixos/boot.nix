{ ... }:

{

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.timeout = 0;

    # kernelPackages = pkgs.linuxPackages_latest;

    # https://docs.kernel.org/gpu/amdgpu/module-parameters.html
    kernelParams = [
      "video=DP-1:1024x1280@60,rotate=270"

      # Silent Boot
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    consoleLogLevel = 0;
    initrd.verbose = false;

    plymouth.enable = true;

  };
 
}
