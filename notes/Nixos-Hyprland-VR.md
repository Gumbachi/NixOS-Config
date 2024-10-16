# Getting VR to work on NixOS/Hyprland

It took me ages to get VR to work wirelessly via ALVR so I am writing this in the hopes of never having to struggle like this again

## Software

* [Steam/SteamVR](https://store.steampowered.com/app/250820/SteamVR/) - Install SteamVR from within Steam
    ```nix
    programs.steam.enable = true;
    ```
* [ALVR](https://github.com/alvr-org/alvr) - Install with a Nix Option  
    ```nix
    programs.alvr = {
        enable = true;
        openFirewall = true;
    };
    ```
* [WlxOverlay-S](https://github.com/galister/wlx-overlay-s) - Optional for desktop streaming
    ```nix
    environment.systemPackages = [ pkgs.wlx-overlay-s ];
    ```

## Linux Kernel Patch

To allow for AMDGPU High Priority Queues the linux kernel needs to be modified on NixOS
```nix
boot.kernelPatches = [
  {
    name = "amdgpu-ignore-ctx-privileges";
    patch = pkgs.fetchpatch {
      name = "cap_sys_nice_begone.patch";
      url = "https://github.com/Frogging-Family/community-patches/raw/master/linux61-tkg/cap_sys_nice_begone.mypatch";
      hash = "sha256-Y3a0+x2xvHsfLax/uwycdJf3xLxvVfkfDVqjkxNaYEo=";
    };
  }
];
```
This will force you to rebuild the kernel manually which takes roughly 30 minutes on a Ryzen 5800X. The workaround for
the long build times can found [here](https://wiki.nixos.org/wiki/VR)

## SteamVR 

General configuration and tweaking for SteamVR

* Running SteamVR asks for sudo priveleges and then errors out
    ```
    sudo setcap CAP_SYS_NICE+ep ~/.local/share/Steam/steamapps/common/SteamVR/bin/linux64/vrcompositor-launcher
    ```

* Launch Options
    ```
    QT_QPA_PLATFORM=xcb WAYLAND_DISPLAY='' ~/.local/share/Steam/steamapps/common/SteamVR/bin/vrmonitor.sh %command%
    ```
    * `QT_QPA_PLATFORM=xcb` - Configures QT to not throw a fit when displaying UI
    * `WAYLAND_DISPLAY=''` - Forces SteamVR to run in XWayland
    * ` ~/.local/share/Steam/steamapps/common/SteamVR/bin/vrmonitor.sh` - run script before launch  

* Missing OpenXR Runtime - Games run on desktop but not on headset  
    1. Check that SteamVR > Settings > OpenXR > Current OpenXR Runtime = None
    2. `mkdir -p ~/.config/openxr/1`
    3. Add this Json file to new directory 
    ```sh
    echo -e '{
        "file_format_version" : "1.0.0",
        "runtime" : {
            "VALVE_runtime_is_steamvr" : true,
            "library_path" : "'$HOME'/.local/share/Steam/steamapps/common/SteamVR/bin/linux64/vrclient.so",
            "name" : "SteamVR"
        }
    }' > ~/.config/openxr/1/active_runtime.json
    ```
    
## Other Notes

* Only launch SteamVR from ALVR or else SteamVR may just crash and disable things
* Make sure that Overlays and Add-Ons are enabled within SteamVR
