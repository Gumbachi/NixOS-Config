# My NixOS Config

1. Clone `https://github.com/Gumbachi/NixOS-Config.git` to home directory
2. Backup /etc/nixos
   `sudo mv /etc/nixos/ /etc/nixos.bak`
3. Link /etc/nixos to ~/NixOS-Config
   `sudo ln -s ~/NixOS-Config/ /etc/nixos`

## Steps

1. `sudo nano /etc/nixos/configuration.nix`
   1. Add `programs.git.enable = true;`
   2. Set `networking.hostname = "nixos";` to `"GOOMBAX1"` or other host
   3. save and exit and reboot
2. `git clone https://github.com/Gumbachi/NixOS-Config.git`
   1. `sudo nano NixOS-Config/configuration.nix`
      1. Set `stateVersion` to the NixOS iso version
3. `sudo mv /etc/nixos/hardware-configuration.nix ~/NixOS-Config/GOOMBAX1/hardware-configuration.nix`
4. `sudo mv /etc/nixos/ /etc/nixos.bak` Backup default config
5. `sudo ln -s ~/NixOS-Config/ /etc/nixos` Link to flake
6. `sudo nixos-rebuild boot` and reboot after finish
7. Sound Devices need to be configured
   1. Open Pavucontrol and go to config
   2. Disable GPU devices and set Astro A50 to game output and Yeti to Analog Stereo Input
   3. Set Volumes in Input and Output tabs
8. Icons & Cursors
   1. `./NixOS-Config/GOOMBAX1/scripts/papirus-icons.sh`
   2. `./NixOS-Config/GOOMBAX1/scripts/catppuccin-cursors.sh`
   3. Open nwg-look
      1. Mouse cursor > Catppuccin-Mauve Size 32
      2. Icon theme > Papirus-Dark
   4. `hyprctl setcursor catppuccin-mocha-mauve-cursors 32`
9. Extra Drives
   1. `mkdir Drives`
   2. `mkdir Drives/InlandPremium1TB`
   3. `mkdir Drives/Samsung1TB`
   4. `mkdir Drives/USB1`
   5. Check drives with `sudo fdisk -l`
   6. `sudo mount /dev/nvmen0n1 Drives/InlandPremium1TB`
   7. `sudo mount /dev/sda1 Drives/Samsung1TB`
   8. Regenerate hardware config
      1. `nixos-generate-config`
      2. `rm NixOS-Config/configuration.nix` not needed
      3. `mv NixOS-Config/hardware-configuration.nix NixOS-Config/GOOMBAX1/hardware-configuration.nix`
   9. `sudo nixos-rebuild switch` drives should auto-mount now
10. Some apps need to be manually configured
   1. Sound Devices
   2. Floorp
      1. Add Bitwarden extension and login
      2. Add Ublock Origin extension
   3. YouTube Music
      1. Login with password from bitwarden
   4. Vesktop
      1. Login with QR Code
      2. Settings > Voice > Disable AGC and Echo Cancellation
   5. ProtonUp
      1. Launch and install latest GE Proton
   6. Steam
      1. Settings > Interface > Choose Beta > Restart
      2. Settings > Compatibility > Enable Proton > Restart > Set to GE Proton
      3. Settings > Downloads > Allow downloads during gameplay > Allow background processing of vulkan shaders
      4. Settings > Storage > Add storage locations
      5. Rocket League > Force Use of Proton
   7. Floorp Continued
      1. Hide Bookmarks bar `Ctrl + Shift + B`
      2. General Settings
         1. Disable `Open previous windows and tabs`
         2. Enable `When you open a link, image or media in a new tab, switch to it immediately`
         3. Disable Container Tabs
         4. Disable Floorp Notes Sync
      3. Design
         1. Select Proton UI
         2. Select Vertical Tab Bar
         3. Enable Collapse Vertical Tab Bar
         4. Enable Show New Tab Button
      4. Sidebar - Disable
      5. Workspaces - Disable
      6. Home
         1. Floorp Home Background > Disable Background
         2. Disable blur, release notes, image credit
         3. Disable all Floorp Home Content except shortcuts. Diable sponsored shortcuts
      7. Search
         1. Set default search engine to duckduckgo
      8. Privacy and Security
         1. Diable ask to save logins and passwords
      9. Remove New Tab, Floorp view, list tabs button from vert bar
      10. Customize Toolbar
         1. Enable Title Bar
