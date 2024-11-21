if [ $(id -u) -ne 0 ]
  then echo Please run this script as root or using sudo!
  exit
fi


echo "### SYMLINK NIXOS-CONFIG ###"

read -p "Hostname: " hostname
echo "Using Hostname: $hostname"

echo Copying hardware configuration...
cp /etc/nixos/hardware-configuration.nix ~/NixOS-Config/$hostname/hardware-configuration.nix
echo Creating backup for /etc/nixos/ ... 
mv /etc/nixos/ /etc/nixos.bak
echo Symlinking NixOS-Config to /etc/nixos/
ln -s ~/NixOS-Config/ /etc/nixos
echo Rebuilding config ...
nixos-rebuild boot
read -p "Reboot to apply changes. Press any key to exit." tmp

