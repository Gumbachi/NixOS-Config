{ pkgs, ... }: {

  programs.alvr = {
    enable = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    wlx-overlay-s 
    # beatsabermodmanager # Something is broken / package outdated
  ];

  users.users.jared.packages = with pkgs; [
    beatsabermodmanager
  ];

  
  
  # boot.kernelPatches = [
  #   {
  #     name = "amdgpu-ignore-ctx-privileges";
  #     patch = pkgs.fetchpatch {
  #       name = "cap_sys_nice_begone.patch";
  #       url = "https://github.com/Frogging-Family/community-patches/raw/master/linux61-tkg/cap_sys_nice_begone.mypatch";
  #       hash = "sha256-Y3a0+x2xvHsfLax/uwycdJf3xLxvVfkfDVqjkxNaYEo=";
  #     };
  #   }
  # ];

}
