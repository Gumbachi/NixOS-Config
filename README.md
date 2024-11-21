# My NixOS/Hyprland Config


| Function       | Package      |
| -------------- | ------------ |
| Window Manager | Hyprland     |
| Editor         | NixVim       |
| Notifications  | AGS          |
| Menu           | Rofi-Wayland |
| System Monitor | Btop         |
| File Manager   | Yazi         |
| Lock Screen    | Hyprlock     |
| Wallpapers     | Waypaper     |

## Steps

1. `nix-shell -p git`
2. `git clone https://github.com/Gumbachi/NixOS-Config.git`
3. `sudo sh ~/NixOS-Config/scripts/symlinkconfig.sh`
4. `reboot`
5. Sound Devices need to be configured
   1. Open Pavucontrol and go to config
   2. Disable GPU devices and set Astro A50 to game output and Yeti to Analog Stereo Input
6. Icons & Cursors
   1. `./NixOS-Config/scripts/papirus-icons.sh`
   2. `./NixOS-Config/scripts/catppuccin-cursors.sh`
   3. Open nwg-look
      1. Mouse cursor > Catppuccin-Mauve Size 32
      2. Icon theme > Papirus-Dark
7. Extra Drives
   1. Check drives with `sudo fdisk -l`
  2. `sudo mount /dev/<drive_id> <Drive Location>`
   3. Regenerate hardware config
      1. `nixos-generate-config`
      2. `rm NixOS-Config/configuration.nix` not needed
      3. `mv NixOS-Config/hardware-configuration.nix NixOS-Config/GOOMBAX1/hardware-configuration.nix`
   4. `sudo nixos-rebuild switch` drives should auto-mount now
8. Some apps need to be manually configured
    1. Sound Devices
    2. Floorp
       1. Extensions: Bitwarden, Ublock, Firefox Color
    3. YouTube Music
       1. Login with password from bitwarden
    4. Vesktop
       1. Login with QR Code
       2. Settings > Voice > Disable AGC and Echo Cancellation
    5. ProtonUp
       1. Launch and install latest GE Proton
    6. Steam
       1. Settings > Interface > Start Location: Library > Choose Beta > Restart
       2. Settings > Compatibility > Enable Proton > Restart > Set to GE Proton
       3. Settings > Downloads > Allow downloads during gameplay > Allow background processing of vulkan shaders
       4. Settings > Storage > Add storage locations
       5. Rocket League > Force Use of Proton
       6. Add desktop files as needed
9. Set up Git SSH and change origin
    1. `ssh-keygen -t ed25519 -a 100 -C "github"`
    2. `cat ~/.ssh/id_ed25519.pub`
    3. Copy output and add to Github SSH Tokens
    4. `z NixOS-Config` and `git remote set-url origin git@github.com:Gumbachi/NixOS-Config.git`
