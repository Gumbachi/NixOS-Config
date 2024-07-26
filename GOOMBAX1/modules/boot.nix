{ config, pkgs, ... }:

{
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
 # boot.kernelPackages = pkgs.linuxPackages_zen;

  # https://docs.kernel.org/gpu/amdgpu/module-parameters.html
  boot.kernelParams = [
    "video=DP-1:3840x2160@240"
    "video=DP-3:2560x1440@144"
  #   # "amdgpu.msi=0"
  #   # "amdgpu.aspm=0"
  #   # "amdgpu.bapm=0"
  #   # "amdgpu.runpm=0"
  #   # "amdgpu.vm_update_mode=0"
  #   # "amdgpu.exp_hw_support=1"

  #   # questionable
  #   # "amdgpu.sched_jobs=64"
  #   # "amdgpu.sched_hw_submission=4"

  #   # "amdgpu.mes=1"
  #   # "amdgpu.mes_kiq=1"
  #   # "amdgpu.sched_policy=1"
  #   # "amdgpu.no_system_mem_limit=1"
  #   # "amdgpu.smu_pptable_id=0"
  ];
  
}
