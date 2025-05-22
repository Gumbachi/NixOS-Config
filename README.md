# My NixOS Config

NixOS Config for all of my machines

## Pre-Flake-Install

1. `nix-shell -p git vim fish --run fish`

   > In the following commands, replace HOST with the correct host e.g. GOOMBAX1

2. `sudo mv /etc/nixos/hardware-configuration.nix ~/NixOS-Config/HOST/hardware-configuration.nix`
3. Configure Extra Drives
   1. Check drives with `sudo blkid -o list`

   > Copy the UUID and remember the fs_type

   2. Add the following to configuration.nix

      ```nix
      # ~/NixOS-Config/HOST/configuration.nix

      fileSystems.<name> = { # Replace <name> with the desired mount point e.g "~/Drives/A" 
        device = "/dev/disk/by-uuid/<UUID>"; # Replace <UUID> with the UUID Copied from earlier
        fsType = <FS_TYPE>; # Replace <FS_TYPE> with the fs_type from earlier (Usually "ext4" or "exfat")
        neededForBoot = false; # Should the computer still boot if this disk isnt present?
      };
      ```
   3. Repeat for extra drives
4. `sudo nixos-rebuild boot --flake ~/NixOS-Config#HOST`
5. `reboot`

## Post-Flake-Install

1. Sound Devices may need to be configured

   > Use pavucontrol

2. Some apps that probably need to be manually configured

   - YouTube Music
   - Vesktop
     - Disable Automatic Gain Control and Echo Cancellation
   - Steam
     - Enable proton in compatibility
     - Allow background shader processing
     - Add external storage locations

3. Set up Git SSH and change origin

   1. `ssh-keygen -t ed25519 -a 100 -C "github"`
   2. `cat ~/.ssh/id_ed25519.pub`
   3. Copy output and add to Github SSH Tokens
   4. `cd ~/NixOS-Config` and
      `git remote set-url origin git@github.com:Gumbachi/NixOS-Config.git`
